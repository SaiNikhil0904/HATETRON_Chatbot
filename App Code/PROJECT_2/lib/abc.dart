
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/DashBoardScreen.dart';
import 'auth/main_page.dart';
void main() => runApp(const MaterialApp(
    // home: conversation()
));
class conversation extends StatelessWidget {
  const conversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text("Welcome to HATETRON",style: TextStyle(
                fontSize: 24,letterSpacing: 2,fontWeight: FontWeight.bold
            ),),
            const Image(image: AssetImage("assets/img.png")),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(

                      builder: (context) => const DashBoardScreen()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(270, 50),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  primary: const Color(0xFF5A00ED)
              ), child: Text("Start your Conversation",style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              // onPressed: (){
              //   Navigator.of(context).push(
              //     MaterialPageRoute(

              //         builder: (context) => const homepage()
              //     ),
              //   );
              //   },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(270, 50),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  primary: const Color(0xFF5A00ED).withOpacity(0.60)
              ),
               onPressed: () {  },
              child: const Text("View Old Conversation",style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
  onPressed: () {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
    );
  },
  color: const Color(0xFF7F35F7),
  minWidth: 230,
  height: 50,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: const Text(
    'Logout',
    style: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
  ),
),

            ],

        ),
      ),
    );
  }

  hp() {}


}