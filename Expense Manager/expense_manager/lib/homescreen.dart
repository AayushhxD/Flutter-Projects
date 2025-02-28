import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_manager/db_helper.dart';
import 'package:expense_manager/drawerscreen.dart';
import 'package:expense_manager/modalClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool _isDarkMode = false;
  String _searchQuery = '';
  late AnimationController _animationController;
  late Animation<double> _fabScaleAnimation;
  late Animation<double> _searchBarAnimation;

  final Map<String, String> categoryImages = {
    "Medicine": "assets/images/Medicine.png",
    "Food": "assets/images/Food.png",
    "Fuel": "assets/images/Fuel.png",
    "Shopping": "assets/images/Shopping.png",
    "Entertainment": "assets/images/Entertainment.png",
  };

  List<TransactionModalClass> transactionList = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadTransactions();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fabScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _searchBarAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadTransactions() async {
    final transactions = await _dbHelper.getTransactions();
    setState(() {
      transactionList = transactions.map((txn) {
        return TransactionModalClass(
          title: txn['category']!,
          amount: txn['amount']!,
          desccription: txn['description']!,
        );
      }).toList();
    });
  }

  void submit({String? oldCategory}) async {
    final newTransaction = {
      'amount': amountController.text,
      'category': categoryController.text,
      'description': descriptionController.text,
    };

    if (oldCategory != null) {
      await _dbHelper.updateTransaction(oldCategory, newTransaction);
    } else {
      await _dbHelper.insertTransaction(newTransaction);
    }

    setState(() {
      if (oldCategory != null) {
        final index =
            transactionList.indexWhere((txn) => txn.title == oldCategory);
        if (index != -1) {
          transactionList[index] = TransactionModalClass(
            title: categoryController.text,
            amount: amountController.text,
            desccription: descriptionController.text,
          );
        }
      } else {
        transactionList.add(TransactionModalClass(
          title: categoryController.text,
          amount: amountController.text,
          desccription: descriptionController.text,
        ));
      }
    });

    Navigator.of(context).pop();
  }

  void bottomSheet({TransactionModalClass? transaction}) {
    if (transaction != null) {
      amountController.text = transaction.amount;
      categoryController.text = transaction.title;
      descriptionController.text = transaction.desccription;
    } else {
      amountController.clear();
      categoryController.clear();
      descriptionController.clear();
    }

    showModalBottomSheet(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              _buildTextField(amountController, 'Enter amount', 'Amount'),
              const SizedBox(height: 20),
              _buildTextField(categoryController, 'Enter category', 'Category'),
              const SizedBox(height: 20),
              _buildTextField(
                  descriptionController, 'Enter description', 'Description'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  submit(oldCategory: transaction?.title);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                  fixedSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: hint,
        labelText: label,
        hintStyle: GoogleFonts.poppins(
          color: _isDarkMode ? Colors.grey[400] : Colors.grey[700],
        ),
        labelStyle: GoogleFonts.poppins(
          color: _isDarkMode ? Colors.white : Colors.black,
        ),
        filled: true,
        fillColor: _isDarkMode ? Colors.grey[800] : Colors.grey[200],
      ),
      style: GoogleFonts.poppins(
        color: _isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = transactionList
        .where((txn) =>
            txn.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            txn.desccription.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
        title: Text(
          "June 2024",
          style: GoogleFonts.poppins(
            color: _isDarkMode ? Colors.white : Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu,
                color: _isDarkMode ? Colors.white : Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ScaleTransition(
              scale: _searchBarAnimation,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  hintText: 'Search transactions...',
                  hintStyle: GoogleFonts.poppins(
                    color: _isDarkMode ? Colors.grey[400] : Colors.grey[700],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                final txn = filteredTransactions[index];
                return FadeTransition(
                  opacity: _animationController,
                  child: ScaleTransition(
                    scale: _animationController,
                    child: Slidable(
                      key: ValueKey(txn.title),
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              bottomSheet(transaction: txn);
                            },
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                transactionList.removeAt(index);
                              });
                              _dbHelper.deleteTransaction(txn.title);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        elevation: 5,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                              categoryImages[txn.title] ??
                                  'assets/images/Default.png',
                            ),
                          ),
                          title: Text(
                            txn.title,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: _isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            txn.desccription,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: _isDarkMode
                                  ? Colors.grey[400]
                                  : Colors.grey[700],
                            ),
                          ),
                          trailing: Text(
                            '₹${txn.amount}',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabScaleAnimation,
        child: FloatingActionButton(
          onPressed: () {
            bottomSheet();
          },
          backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
