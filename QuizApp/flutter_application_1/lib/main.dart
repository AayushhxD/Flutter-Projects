import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
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
  State createState() => _QuizApp();
}

// ignore: camel_case_types
class singlequestionformat {
  final String? questions;
  final List<String>? options;
  final int? answer;

  const singlequestionformat({this.questions, this.answer, this.options});
}

class _QuizApp extends State {
  bool questionPage = true;
  int questionNo = 0;
  int ansNo = -1;
  int score = 0;

  MaterialStateProperty<Color?> isanswercorrect(int selectedindex) {
    if (ansNo != -1) {
      if (selectedindex == questions[questionNo].answer) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedindex == ansNo) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void checkpageisvalide() {
    if (ansNo == -1) {
      return;
    }
    if (ansNo == questions[questionNo].answer) {
      score++;
    }
    if (ansNo != -1) {
      if (questionNo == questions.length - 1) {
        questionPage = false;
        setState(() {});
      }
      setState(() {
        ansNo = -1;
        questionNo++;
      });
    }
  }

  List questions = [
    const singlequestionformat(
        questions:
            "Who developed the Flutter Framework and continues to maintain it today?",
        options: ["Facebook", "Microsoft", "Google", "Oracle"],
        answer: 2),
    const singlequestionformat(
        questions:
            " Which programming language is used to build Flutter applications?",
        options: ["Kotlin", "Dart", "Java", "Flutter"],
        answer: 1),
    const singlequestionformat(
        questions:
            " What widget would you use for repeating content in Flutter?",
        options: ["ExpandedView", "ListView", "Stack", "ArrayView"],
        answer: 1),
    const singlequestionformat(
        questions:
            " Which component allow us to specify the distance between widgets on the screen.",
        options: ["Table", "AppBar", "SizedBox", "Safe Area"],
        answer: 2),
    const singlequestionformat(
        questions:
            "Which of the following is used to load images from the flutter project’s assets?",
        options: ["Image", "Image.file", "Image.asset", "Image.memory"],
        answer: 2),
  ];

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(159, 140, 202, 1),
          title: Text(
            "QuizApp",
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionNo + 1}/${questions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 380,
              height: 50,
              child: Text(
                questions[questionNo].questions,
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 0;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(0)),
                  child: Text("A.${questions[questionNo].options[0]}",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 1;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(1)),
                  child: Text("B.${questions[questionNo].options[1]}",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 2;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(2)),
                  child: Text("C.${questions[questionNo].options[2]}",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 3;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(3)),
                  child: Text("D.${questions[questionNo].options[3]}",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ))),
              // (ansNo==questions[questionNo].answer)?
              // const Icon(Icons.done,color: Colors.green,):const SizedBox()
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            checkpageisvalide();
          },
          backgroundColor: const Color.fromRGBO(159, 140, 202, 1),
          child: const Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(159, 140, 202, 1),
          title: Text(
            "QuizApp",
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              "https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
              height: 500,
              width: 480,
            ),
            Text(
              "Congratulations!!!",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You have completed the Quiz.",
              style: GoogleFonts.quicksand(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You Score: $score/${questions.length}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(300, 50),
                  backgroundColor: const Color.fromRGBO(159, 140, 202, 1),
                ),
                onPressed: () {
                  setState(() {
                    ansNo = -1;
                    questionNo = 0;
                    questionPage = true;
                    score = 0;
                  });
                },
                child: Text("Reset",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
