import 'package:flutter/material.dart';
import 'package:project_2/Home.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyDxpI1pzoAzjYgnOpzqvkOlQr4UWGUazhE",
      appId: "1:228854299839:android:d1ff046730499ad8321a0a",
      messagingSenderId: "228854299839",
      projectId: "hatespeechdetection-bot",
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HATETRON',

      home: Home(),
    );
  }
}





