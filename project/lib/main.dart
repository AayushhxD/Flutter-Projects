import 'package:flutter/material.dart';
import 'package:project/gnav_bar.dart/nav_bar.dart';
import 'package:project/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCcJpp5rAToCdC-CS01z_cbOO8ytLnZTEM",
          appId: "1:1032783680762:android:5101e179ecc08c546f6543",
          messagingSenderId: "1032783680762",
          projectId: "studentinfo-9cf99",
          storageBucket: "gs://studentinfo-9cf99.firebasestorage.app"));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
