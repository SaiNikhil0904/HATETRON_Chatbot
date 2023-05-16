import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../abc.dart';
import 'fotgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{


  /// text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:_emailController.text.trim(),
      password:_passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 125),
                Text('Hello Again',style: GoogleFonts.bebasNeue(fontSize: 40),),
                const SizedBox(
                  height: 20,
                ),
                const Text('Welcome back, you\'ve been missed',style: TextStyle(fontSize: 20),),
                const SizedBox(height: 35),
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
                ///password
                Padding(padding:
                const EdgeInsets.symmetric(horizontal:25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x6681F7F3),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),

                      child: TextField(


                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock) ,
                          border: InputBorder.none,
                          hintText: 'Password',
                          labelText: "Password",

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///sign in button
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 76.0),
                  child: GestureDetector(
                    onTap:signIn,
                    //   onTap: () {
                    //   // Navigate to another page
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const conversation()),
                    //   );
                    // },
                    child: Container(
                        padding:const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xE604B4AE),
                          borderRadius: BorderRadius.circular(27),
                        ),
                        child:const Center(
                          child: Text(
                            'LOGIN',
                            style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),

                          ),
                        )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///not a member ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Color(0xFF04B4AE),
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return const ForgotPasswordPage();
                      },),);
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Color(0xFF04B4AE),fontWeight: FontWeight.bold),
                  ),
                )




              ],
            ),
          ),

        ),
      ),
    );

  }
}