import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:routegen/model/bus_fetcher.dart';
// import 'package:routegen/test.dart';
// import 'package:routegen/view/onboarding_screen.dart';
import "package:routegen/view/jaydeep/splashscreen.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC39AdUqHPkodML7BkZhkUBmlshIA9fF5A",
          appId: "732365243339",
          messagingSenderId: "1:759125997561:android:f2fcf6439ceb6d20246f28",
          projectId: "routegen-b64ac"));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RouteGen',
      home: SplashscreenPage(),
    );
  }
}
