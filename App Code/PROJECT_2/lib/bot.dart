
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:project_2/DashBoardScreen.dart';
import 'package:project_2/Screen/recognization_page.dart';
import 'package:project_2/Utils/image_cropper_page.dart';
import 'package:project_2/Utils/image_picker_class.dart';
import 'package:project_2/message.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
const String apiUrl = 'https://hatespeech.azurewebsites.net';

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkMode = false;

  void updateTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}


class bot extends StatefulWidget {
  bot({
    this.data,
  });
  String? data;
  @override
  _botState createState() => _botState();
}
class _botState extends State<bot> {
  bool _showAdditionalIcons = false;

  final TextEditingController _controller = TextEditingController();
  // TextEditingController _control = TextEditingController();
  String _prediction = '';
  List<Map<String, dynamic>> messages = [];

  @override

  void initState() {
    super.initState();
    _controller.text = widget.data ?? '';

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
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        title: const Text(
          "HATETRON",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "poppins",
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 5,
            height: 1.0, // this sets the line height to 24
            shadows: [
              Shadow(
                blurRadius: 6.0,
                color: Color.fromARGB(124, 23, 23, 23),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(
            MaterialPageRoute(builder: (context) => const DashBoardScreen()),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            // const SizedBox(height: 16.0),

            if (messages.length == 2)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    sendMessage("Say Hello!!");
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
                  ElevatedButton(
                    onPressed: () {
                      sendMessage("Enter the text manually");
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 44),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color(0xFF04B4AE), width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: const Color(0xFF04B4AE),
                    ),
                    child: const Text(
                      'Enter the text',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),

                  const SizedBox(
                      width: 16), // Add some space between the buttons

                  ElevatedButton(
                    onPressed: () {
                      sendMessage("Scan the text");
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 44),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color(0xFF04B4AE), width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: const Color(0xFF04B4AE),
                    ),
                    child: const Text(
                      'Scan the text',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
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
                          title: const Text(
                            'Gallery',
                            style: TextStyle(
                              color: Color(0xFF04B4AE),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            log("Gallery");
                            pickImage(source: ImageSource.gallery)
                                .then((value) {
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
                                });
                              }
                            });
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.camera_alt_rounded),
                          title: const Text(
                            'Take photo',
                            style: TextStyle(
                              color: Color(0xFF04B4AE),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            log("Camera");
                            pickImage(source: ImageSource.camera).then(
                                  (value) {
                                if (value != '') {
                                  imageCropperView(value, context)
                                      .then((value) {
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
                                  });
                                }
                                ;
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
                      // onPressed: () {
                      //   sendMessage(_controller.text);
                      //   _controller.clear();
                      // },
                        onPressed: () {
                        void predict(inputText) async {
                          sendMessage(inputText);

                          final response = await http.get(Uri.parse('$apiUrl/?text=$inputText'));
                          if (response.statusCode == 200) {
                            final json = jsonDecode(response.body);
                            String result = json['result'];
                            if (result == 'Safe_Speech') {
                              result = '$inputText is a Safe Speech';

                              addMessage(
                                  Message(text: DialogText(text: const ['This is a Safe Speech'])), false);

                            } else if (result == 'Hate_Speech') {
                              result = '$inputText is a Hate Speech';
                              addMessage(
                                Message(text: DialogText(text: const ['This is a Hate Speech'])), false);
                            } else if (result == 'Offensive_Speech') {
                              result = '$inputText is a Offensive Speech';
                              addMessage(
                                  Message(text: DialogText(text: const ['This is an Offensive Speech'])), false);

                            }
                            setState(() {
                              _prediction = result;
                            });
                          } else {
                            print('Error: ${response.statusCode}');
                          }
                          _controller.clear();
                        }
                        String inputText = _controller.text;
                        if(inputText.isEmpty){
                          print("Message is empty");
                        }
                        else{
                          predict(inputText);
                        }
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
      } else if (text == "Enter the text manually") {
        addMessage(
            Message(text: DialogText(text: const ['Enter your comment'])),
            false);
      } else if (text == "Scan the text") {
        addMessage(Message(text: DialogText(text: const ['Scanning the text'])),
            false);
      }
      }

  }
  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}



