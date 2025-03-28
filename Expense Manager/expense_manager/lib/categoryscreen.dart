import 'package:expense_manager/ChangeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawerscreen.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State createState() => _MyCategory();
}

class _MyCategory extends State<MyCategory> {
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _categoryNameController = TextEditingController();

  void addCategoryBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromRGBO(140, 128, 128, 0.2)),
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: Color.fromRGBO(125, 125, 125, 1),
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Image URL",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  hintText: "Enter URL",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9)),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              TextFormField(
                controller: _categoryNameController,
                decoration: InputDecoration(
                  hintText: "Enter Category",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9)),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final imageUrl = _imageUrlController.text;
                  final categoryName = _categoryNameController.text;
                  if (imageUrl.isNotEmpty && categoryName.isNotEmpty) {
                    Provider.of<CategoryProvider>(context, listen: false)
                        .addCategory(imageUrl, categoryName);
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                    fixedSize: const Size(150, 50)),
                child: const Text(
                  "Add",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  void showMyDialog(int index) {
    showDialog(
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Delete Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          content: const SizedBox(
            height: 36,
            width: 215,
            child: Text(
              "Are you sure you want to delete the selected category?",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Provider.of<CategoryProvider>(context, listen: false)
                    .deleteCategory(index);
                Navigator.of(context).pop();
              },
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(14, 161, 125, 1),
                ),
                child: const Center(
                  child: Text(
                    "Delete",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(140, 128, 128, 0.2),
                ),
                child: const Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).categories;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              showMyDialog(index);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        spreadRadius: 2,
                        blurRadius: 8),
                  ]),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      categories[index].keys.toList()[0],
                      height: 74,
                      width: 74,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      categories[index].values.toList().first,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: const Text(
          "Add Category",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        icon: const Icon(Icons.add_circle_rounded,
            color: Color.fromRGBO(14, 161, 125, 1), size: 33),
        onPressed: () {
          addCategoryBottomSheet();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(67)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
