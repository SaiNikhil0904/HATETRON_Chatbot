import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }
  Future passwordReset() async{
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
    showDialog(context: context,
        builder:(context) {
          return const AlertDialog(
            content: Text('password reset link sent! Check your email'),
          );
        },
        );

  }
   on FirebaseAuthException catch(e){
    print(e);
    showDialog(context: context,
        builder:(context){
      return AlertDialog(content: Text(e.message.toString()),);
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04B4AE),
        elevation: 0,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter Your Email and we will send you a password reset link',style: TextStyle(fontSize: 24),),
          ),
          const SizedBox(
            height: 20,
          ),
          ///email text field
          Padding(padding:
          const EdgeInsets.symmetric(horizontal:25),
            child: Container(

              decoration: BoxDecoration(

                color: const Color(0x6681F7F3),

                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail) ,
                    border: InputBorder.none,
                    hintText: 'Email',
                    labelText: "Email",

                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(onPressed:passwordReset,
          child:const Text('Reset Password'),
            color: const Color(0xFF04B4AE),
          ),
        ],
      ),
    );
  }
}
