import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_2/on_Boarding.dart';

void main() => runApp(const MaterialApp(home: Home()));
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Onboarding(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF04B4AE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/1.png")),
            Text(
              "HATETRON",
              style: TextStyle(
                fontFamily: "Rowdies",
                fontWeight: FontWeight.w800,
                // fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
                letterSpacing: 6,
                height: 1.0, // this sets the line height to 24
                shadows: [
                  Shadow(
                    blurRadius: 6.0,
                    // color: Colors.black,
                    color: Color.fromARGB(124, 23, 23, 23),
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
