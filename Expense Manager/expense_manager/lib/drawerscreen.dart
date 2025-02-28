import 'package:expense_manager/categoryscreen.dart';
import 'package:expense_manager/graphscreen.dart';
import 'package:expense_manager/homescreen.dart';
import 'package:expense_manager/trashscreen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  bool transactionFlag = false;
  bool graphFlag = false;
  bool categoryFlag = false;
  bool trashFlag = false;
  bool aboutusFlag = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      width: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Expense Manager",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const Text(
                  "Saves all your Transactions",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildDrawerItem(
            context,
            icon: Icons.my_library_books_outlined,
            title: "Transaction",
            flag: transactionFlag,
            onTap: () {
              setState(() {
                transactionFlag = true;
                graphFlag = false;
                categoryFlag = false;
                trashFlag = false;
                aboutusFlag = false;
              });
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.data_saver_off_outlined,
            title: "Graphs",
            flag: graphFlag,
            onTap: () {
              setState(() {
                graphFlag = true;
                transactionFlag = false;
                categoryFlag = false;
                trashFlag = false;
                aboutusFlag = false;
              });
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyAppGraphs()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.label,
            title: "Category",
            flag: categoryFlag,
            onTap: () {
              setState(() {
                categoryFlag = true;
                transactionFlag = false;
                graphFlag = false;
                trashFlag = false;
                aboutusFlag = false;
              });
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCategory()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.delete,
            title: "Trash",
            flag: trashFlag,
            onTap: () {
              setState(() {
                trashFlag = true;
                transactionFlag = false;
                graphFlag = false;
                categoryFlag = false;
                aboutusFlag = false;
              });
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyAppTrash()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person,
            title: "About Us",
            flag: aboutusFlag,
            onTap: () {
              setState(() {
                aboutusFlag = true;
                transactionFlag = false;
                graphFlag = false;
                categoryFlag = false;
                trashFlag = false;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required bool flag,
    required VoidCallback onTap,
  }) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            onTap();
            _animationController.forward().then((_) {
              _animationController.reverse();
            });
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 45,
            width: 185,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: flag
                  ? const Color.fromRGBO(14, 161, 125, 0.15)
                  : const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: flag
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Icon(
                  icon,
                  color: const Color.fromRGBO(4, 161, 125, 1),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: flag
                          ? const Color.fromRGBO(14, 161, 125, 1)
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
