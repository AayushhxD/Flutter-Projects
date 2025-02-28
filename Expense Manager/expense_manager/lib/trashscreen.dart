import "package:expense_manager/drawerscreen.dart";
import "package:flutter/material.dart";

class MyAppTrash extends StatefulWidget {
  const MyAppTrash({super.key});

  @override
  State createState() => _MyAppTrashState();
}

class _MyAppTrashState extends State<MyAppTrash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trash",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              height: 91,
              width: 370,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_circle_rounded,
                            color: Colors.grey,
                            size: 35,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: const Row(
                              children: [
                                Text(
                                  "Food",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "600",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            width: 251,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry... more",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "3 June | 11:50 AM",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                  const Divider()
                ],
              ),
            );
          }),
    );
  }
}
