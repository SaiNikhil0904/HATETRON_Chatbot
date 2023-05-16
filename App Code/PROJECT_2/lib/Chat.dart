import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:project_2/DashBoardScreen.dart';
import 'package:project_2/Screen/recognization_page.dart';
import 'package:project_2/Utils/image_cropper_page.dart';
import 'package:project_2/Utils/image_picker_class.dart';
import 'package:project_2/chat1.dart';
import 'package:project_2/message.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

Color teal = const Color(0xFF04B4AE);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HATETRON',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.deepPurple,
      ),
      home: const Homee(),
    );
  }
}

class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();

}


class _HomeState extends State<Homee> {
  bool _showAdditionalIcons = false;
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();

    addMessage(
        Message(text: DialogText(text: const ['Hi! I am HateTron'])), false);
    addMessage(
        Message(text: DialogText(text: const ['How can i help you?'])), false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04B4AE),
        centerTitle: true,
        elevation: 0, // removes the shadow
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(  bottomLeft: Radius.circular(24),  bottomRight: Radius.circular(24), ),
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
            builder: (context) => const DashBoardScreen()
        ),),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            const SizedBox(height: 25.0),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(5),
              dashPattern: [8, 4], // dashed pattern
              strokeWidth: 2,
              color: teal,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Type "Hello" to start conversation with the chatbot ',
                  style: TextStyle(
                    color: teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16, width: 8),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(5),
              dashPattern: [8, 4], // dashed pattern
              strokeWidth: 2,
              color: teal,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'The chatbot will give you two choices for providing input: manually typing text or scanning the text.Choose the desired selection, then provide the input.',
                  style: TextStyle(
                    color: teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16, width: 8),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(5),
              dashPattern: [8, 4], // dashed pattern
              strokeWidth: 2,
              color: teal,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "The chatbot will take the input and detect if it's a hate speech, offensive or neither.",
                  style: TextStyle(
                    color: teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


            const SizedBox(height: 16.0),

            if (messages.length == 2)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyAppp()));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 44),
                    shape: RoundedRectangleBorder(
                      side:
                      const BorderSide(color: Color(0xFF04B4AE), width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: const Color(0xFF04B4AE),
                  ),
                  child: const Text(
                    'Say Hello!!',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),

            if (messages.length == 4)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton( onPressed: () { sendMessage("Enter the text manually"); },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 44),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF04B4AE), width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: const Color(0xFF04B4AE),
                    ),
                    child: const Text( 'Enter the text',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),

                  const SizedBox(width: 16), // Add some space between the buttons

                  ElevatedButton( onPressed: () { sendMessage("Scan the text");},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 44),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF04B4AE), width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: const Color(0xFF04B4AE),
                    ),
                    child: const Text(
                      'Scan the text',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 25.0),


            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [


                  PopupMenuButton(
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFF04B4AE),
                    ),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.attach_file_rounded),
                          title: const Text('Gallery',  style: TextStyle(
                            color: Color(0xFF04B4AE),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),),
                          onTap: () {
                            log("Gallery");
                            pickImage(source: ImageSource.gallery).then((value) {
                              if (value != '') {
                                imageCropperView(value, context).then((value) {
                                  if (value != '') {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) => RecognizePage(
                                          path: value,
                                        ),
                                      ),
                                    );
                                  }
                                });                              }
                            });
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.camera_alt_rounded),
                          title: const Text('Take photo',
                            style: TextStyle(
                              color: Color(0xFF04B4AE),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),),
                          onTap:() {
                            log("Camera");
                            pickImage(source: ImageSource.camera).then((value) {
                              if (value != '') {
                                imageCropperView(value, context).then((value) {
                                  if (value != '') {
                                    Navigator.push( context,  CupertinoPageRoute( builder: (_) => RecognizePage(  path: value,),  ),  );
                                  }
                                });
                              };
                            },
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    flex: 8,
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    child: IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: const Icon(Icons.send, color: Color(0xFF04B4AE)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      if (text == "Say Hello!!") {
        addMessage(
            Message(
                text: DialogText(text: const [
                  'To start, you have to input the text. How would you like to input the comment?'
                ])),
            false);
      }
      else if (text == "Enter the text manually") {
        addMessage(
            Message(
                text: DialogText(text: const [
                  'Enter your comment'
                ])),
            false);
      }
      else if (text == "Scan the text") {
        addMessage(
            Message(
                text: DialogText(text: const [
                  'Scanning the text'
                ])),
            false);
      }
      else {
        DetectIntentResponse response = await dialogFlowtter.detectIntent(
            queryInput: QueryInput(text: TextInput(text: text)));
        if (response.message == null) return;
        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }}