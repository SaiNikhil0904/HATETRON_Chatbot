import 'package:project_2/Chat.dart';
import 'package:flutter/material.dart';
import 'package:project_2/pages/home_page.dart';
import 'bot.dart';
void main() => runApp(const MaterialApp(
    home: DashBoardScreen()
));
class DashBoardScreen extends StatelessWidget{
  const DashBoardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFF04B4AE),
        centerTitle: true,
        elevation: 0, // removes the shadow
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
    ),
  ),
        title: const Text( "HATETRON", textAlign: TextAlign.center,
          style: TextStyle( fontFamily: "poppins",  fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white,  letterSpacing: 5,  height: 1.0, // this sets the line height to 24
          shadows: [
            Shadow( blurRadius: 6.0,  color: Color.fromARGB(124, 23, 23, 23), offset: Offset(2, 2), ),
        ],
        ),
      ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop(  MaterialPageRoute(
            builder: (context) => homepage()
        ),),
        ),
      ),

      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.78,
          height: MediaQuery.of(context).size.height * 0.338,
          child: Container(
            padding: const EdgeInsets.all(16.0),

            decoration: BoxDecoration(
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/bot.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Text( "First time using the app ?",
                    style: TextStyle( fontFamily: 'Nobile', fontSize: 23, color: Colors.black, ),
                  ),

                  const SizedBox(height: 17,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => bot()));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(104.98, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          primary: const Color(0xFFFE2E2E),
                        ),
                        child: const Text( "No",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),

                      const SizedBox(width: 10,),

                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Homee()));
                        },
                        //  => print("it's pressed"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(104.98, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          primary: const Color(0xFF04B404),
                        ),
                        child: const Text( "Yes",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),

                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
