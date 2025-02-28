import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:expense_manager/drawerscreen.dart'; // Import your drawer screen

class MyAppGraphs extends StatefulWidget {
  const MyAppGraphs({super.key});

  @override
  State createState() => _MyAppGraphsState();
}

class _MyAppGraphsState extends State<MyAppGraphs> {
  // Sample data
  Map<String, double> data = {};
  List<Map<String, String>> categories = [];
  List<String> prices = [];

  // Simulate fetching data
  Future<void> _fetchData() async {
    // Mock data fetching
    // Replace this with your actual data fetching logic
    await Future.delayed(const Duration(seconds: 2));

    // Example data
    final fetchedData = {
      "Medicine": 650.0,
      "Fuel": 600.0,
      "Food": 500.0,
      "Shopping": 325.0,
      "Entertainment": 325.0,
    };

    // Update categories and prices based on fetched data
    final fetchedCategories = [
      {"assets/images/Medicine.png": "Medicine"},
      {"assets/images/Food.png": "Food"},
      {"assets/images/Fuel.png": "Fuel"},
      {"assets/images/Shopping.png": "Shopping"},
      {"assets/images/Entertainment.png": "Entertainment"}
    ];

    final fetchedPrices = fetchedData.values
        .map((price) => "₹ ${price.toStringAsFixed(2)}")
        .toList();

    // Set state with fetched data
    setState(() {
      data = fetchedData;
      categories = fetchedCategories;
      prices = fetchedPrices;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = data.values.fold(0.0, (sum, item) => sum + item);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Graphs",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 30),
          if (data.isNotEmpty) // Check if data is available
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Expanded(
                child: PieChart(
                  dataMap: data,
                  chartType: ChartType.ring,
                  animationDuration: const Duration(milliseconds: 2000),
                  colorList: const [
                    Color.fromRGBO(214, 3, 3, 0.7),
                    Color.fromRGBO(0, 148, 255, 0.7),
                    Color.fromRGBO(0, 174, 91, 0.7),
                    Color.fromRGBO(100, 62, 255, 0.7),
                    Color.fromRGBO(241, 38, 196, 0.7),
                  ],
                  chartRadius:
                      MediaQuery.of(context).size.width / 2.5, // Adjust size
                  ringStrokeWidth: 40,
                  centerText: "Total ₹${totalAmount.toStringAsFixed(2)}",
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: false,
                  ),
                ),
              ),
            )
          else
            const Center(
                child:
                    CircularProgressIndicator()), // Show a loading spinner if data is not available
          const SizedBox(height: 20),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 65,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(
                        categories[index].keys.first,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        categories[index].values.first,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        prices[index],
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 15,
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 30),
              Text(
                "₹${totalAmount.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
