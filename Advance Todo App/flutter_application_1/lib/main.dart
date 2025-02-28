import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pd;
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    pd.join(await getDatabasesPath(), "cards1.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        '''
        CREATE TABLE cards(
          title TEXT PRIMARY KEY,
          description TEXT,
          date TEXT
        )
        ''',
      );
    },
  );
  runApp(const MainApp());
}

dynamic database;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

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
    return {
      'title': title,
      'description': description,
      'date': date,
    };
  }

  @override
  String toString() {
    return "{title:$title},{description:$description},{date:$date}";
  }
}

class _MainAppState extends State<TodoApp> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> validKey = GlobalKey<FormState>();
  List<ToDoModelClass> cards = [];

  @override
  void initState() {
    super.initState();
    refreshCards();
  }

  Future<void> refreshCards() async {
    cards = await getCards();
    setState(() {});
  }

  Future<List<ToDoModelClass>> getCards() async {
    final localDB = await database;
    List<Map<String, dynamic>> listCards = await localDB.query("cards");
    return List.generate(listCards.length, (i) {
      return ToDoModelClass(
        title: listCards[i]['title'],
        description: listCards[i]['description'],
        date: listCards[i]['date'],
      );
    });
  }

  Future<void> insertCardData(ToDoModelClass obj) async {
    try {
      final localDB = await database;
      await localDB.insert(
        "cards",
        obj.modelMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      refreshCards();
    } catch (e) {
      print("Error inserting data: $e");
    }
  }

  Future<void> updateDatabase(ToDoModelClass obj) async {
    try {
      final localDB = database;
      await localDB.update(
        "cards",
        obj.modelMap(),
        where: "title = ?",
        whereArgs: [obj.title],
      );
      refreshCards();
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  Future<void> deleteCardFromDb(ToDoModelClass obj) async {
    try {
      final localDB = await database;
      await localDB.delete('cards', where: "title =?", whereArgs: [obj.title]);
      refreshCards();
    } catch (e) {
      print("Error deleting data: $e");
    }
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
        await insertCardData(
          ToDoModelClass(
            title: titleController.text,
            description: descController.text,
            date: dateController.text,
          ),
        );
      } else {
        toDoModelobj!.title = titleController.text;
        toDoModelobj.description = descController.text;
        toDoModelobj.date = dateController.text;
        await updateDatabase(toDoModelobj);
      }
      Navigator.pop(context);
      clearController();
    }
  }

  void editCard(ToDoModelClass toDoModelobj) {
    titleController.text = toDoModelobj.title;
    descController.text = toDoModelobj.description;
    dateController.text = toDoModelobj.date;
    bottomSheet(true, toDoModelobj);
  }

  void deleteCard(ToDoModelClass obj) async {
    await deleteCardFromDb(obj);
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
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Good Morning",
                style: GoogleFonts.quicksand(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Ayush",
                style: GoogleFonts.quicksand(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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
                    Text(
                      "CREATE TO DO LIST",
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
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
                                    Image.asset(
                                      'assets/images/1.png',
                                      width: 70,
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
          shape: const CircleBorder(),
          backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
          onPressed: () {
            bottomSheet(false);
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(bool? isEdit, [ToDoModelClass? toDoModelobj]) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
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
                  Text(
                    "Create To-Do",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.quicksand(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      TextFormField(
                        style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                      Text(
                        "Task",
                        style: GoogleFonts.quicksand(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      TextFormField(
                        style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: descController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                      Text(
                        "Date",
                        style: GoogleFonts.quicksand(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      TextFormField(
                        style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        readOnly: true,
                        controller: dateController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                      minimumSize: MaterialStatePropertyAll(Size(300, 50)),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(89, 57, 241, 1),
                      ),
                    ),
                    onPressed: () {
                      validKey.currentState!.validate();
                      if (!isEdit!) {
                        submitData(isEdit);
                      } else {
                        submitData(isEdit, toDoModelobj);
                      }
                    },
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
