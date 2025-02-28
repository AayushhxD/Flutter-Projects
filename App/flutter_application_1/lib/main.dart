import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pd;

dynamic database;

Future<List<ToDoModelClass>> getCards() async {
  final localDB = await database;
  List<Map<String, dynamic>> listCards = await localDB.query("cards");
  return List.generate(listCards.length, (i) {
    return ToDoModelClass(
        title: listCards[i]['title'],
        description: listCards[i]['description'],
        date: listCards[i]['date']);
  });
}

//delete
Future<void> deleteCardFromDb(ToDoModelClass obj) async {
  final localDB = await database;
  await localDB.delete('cards', where: "title =?", whereArgs: [obj.title]);
}

void main() async {
  runApp(const MainApp());
  database = openDatabase(pd.join(await getDatabasesPath(), "cards1.db"),
      version: 1, onCreate: (db, version) async {
    await db.execute('''
        CREATE TABLE cards(
          title TEXT PRIMARY KEY,
          description TEXT,
          date TEXT
        )
       ''');
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _MainAppState();
}

class ToDoModelClass {
  String title;
  String description;
  String date;

  ToDoModelClass({
    required this.title,
    required this.description,
    required this.date,
  });
  Map<String, dynamic> modelMap() {
    return {'title': title, 'description': description, 'date': date};
  }

  @override
  String toString() {
    return "{title:$title},{description:$description},{date:$date}";
  }
}

class _MainAppState extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> validKey = GlobalKey<FormState>();
  List<ToDoModelClass> cards = [];
  bool checked = false;
  Future<void> updateDatabase(ToDoModelClass obj) async {
    final localDB = database;
    await localDB.update(
      "cards",
      obj.modelMap(),
      where: "title = ?",
      whereArgs: [obj.title],
    );
    cards = await getCards();
    setState(() {});
  }

  Future insertCardData(ToDoModelClass obj) async {
    final localDB = await database;
    await localDB.insert(
      "cards",
      obj.modelMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void clearController() {
    titleController.clear();
    descController.clear();
    dateController.clear();
  }

  void submitData(bool doEdit, [ToDoModelClass? toDoModelobj]) async {
    if (titleController.text.trim().isNotEmpty &&
        descController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doEdit) {
        setState(() {
          insertCardData(
            ToDoModelClass(
                title: titleController.text,
                description: descController.text,
                date: dateController.text),
          );
        });
        Navigator.pop(context);
        clearController();
      } else {
        setState(() {
          toDoModelobj!.title = titleController.text;
          toDoModelobj.description = descController.text;
          toDoModelobj.date = dateController.text;
        });
        await updateDatabase(toDoModelobj!);
        Navigator.pop(context);
        clearController();
      }
    }
    cards = await getCards();
    setState(() {});
  }

  void editCard(ToDoModelClass toDoModelobj) {
    titleController.text = toDoModelobj.title;
    descController.text = toDoModelobj.description;
    dateController.text = toDoModelobj.date;
    bottomSheet(true, toDoModelobj);
  }

  void deleteCard(ToDoModelClass obj) async {
    deleteCardFromDb(obj);
    cards = await getCards();
    setState(() {});
  }

  Color getColor([int? index]) {
    if (index == cards.length % index!) {
      return const Color.fromRGBO(111, 81, 255, 1);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            // Container(
            //   padding: const EdgeInsets.only(left: 35),
            //   child: const Text(
            //     "Good Morning",
            //     style: TextStyle(fontSize: 40),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Good Morning",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Welcome",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                    Text("My Daily Diary",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 50),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      editCard(cards[index]);
                                    },
                                    icon: Icons.edit,
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      deleteCard(cards[index]);
                                    },
                                    icon: Icons.delete,
                                  )
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://tse4.mm.bing.net/th?id=OIP.bf_Um5shxy9Snj8HbRR0ZAHaHa&pid=Api&P=0&h=180",
                                      width: 45,
                                      height: 45,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cards[index].title,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            cards[index].description,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            cards[index].date,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          getColor(index);
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          height: 13,
                                          width: 13,
                                          decoration: BoxDecoration(
                                              color: getColor(-1),
                                              shape: BoxShape.circle,
                                              border: Border.all(width: 0.05)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
          onPressed: () {
            bottomSheet(false);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(
    bool? isEdit, [
    ToDoModelClass? toDoModelobj,
  ]) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Form(
              key: validKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Create Tasks"),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Add title"),
                      const SizedBox(
                        width: 50,
                      ),
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter title";
                          } else {
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Add Task"),
                      const SizedBox(
                        width: 50,
                      ),
                      TextFormField(
                        controller: descController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter description";
                          } else {
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Add Date"),
                      const SizedBox(
                        width: 50,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: dateController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffix: Icon(Icons.calendar_month),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2025));
                          String formatedDate =
                              DateFormat.yMMMMd().format(pickedDate!);
                          setState(() {
                            dateController.text = formatedDate;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter date";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(2, 167, 177, 1))),
                      onPressed: () {
                        bool submitValidator =
                            validKey.currentState!.validate();
                        if (!isEdit!) {
                          submitData(isEdit);
                        } else {
                          submitData(isEdit, toDoModelobj);
                        }
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
