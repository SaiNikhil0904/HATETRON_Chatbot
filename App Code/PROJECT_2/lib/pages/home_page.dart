import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../DashBoardScreen.dart';
class homepage extends StatefulWidget {
  const homepage({Key?key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}
class _homepageState extends State<homepage>{
  final user = FirebaseAuth.instance.currentUser!;
  ///document IDs
  List<String>docId =[];
  ///get docIDs
  Future getDocId() async{
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((document) {
      print(document.reference);
      docId.add(document.reference.id);

    }));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor:const Color(0xE6FAFAFA) ,
        body:Center(


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -0.7), // 20% of image height upwards
                  child: const FractionalTranslation(
                    translation: Offset(0, -0.15),
                    child: Image(image: AssetImage("assets/images/conversation1.png")),
                  ),
                ),

                const Text(
                  'Welcome to Hatetron',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),
                const Padding(
                  padding:EdgeInsets.all(10.0),
                  // EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                  child: Text(
                    'Our app promotes safe communication by detecting and flagging hate speech in online conversations!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                MaterialButton(onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(

                        builder: (context) => const DashBoardScreen()
                    ),
                  );
                },

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                  color: const Color(0xFF04B4AE),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Start your Conversation',style: TextStyle(height: 1.3,fontSize: 24,color: Color(
                        0xE6FCFCFC)),),
                  ),),

                // Image(image: AssetImage("assets/User.png"),height: 300,width: 200,),
                const SizedBox(
                  height: 20,
                )
                ,

                const SizedBox(
                  height: 5,
                ),
                MaterialButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),

                  color: const Color(0xE604B4AE),
                  child: const Padding(

                      padding: EdgeInsets.all(8.0),
                      child: Text('Logout',style: TextStyle(height: 1,fontSize: 18,color: Colors.white,),)
                  ),),
              ],
            ))
    );
  }
}