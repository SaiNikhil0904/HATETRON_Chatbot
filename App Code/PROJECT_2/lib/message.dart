import 'package:flutter/material.dart';
class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}
class _MessagesScreenState extends State<MessagesScreen> {
  String _prediction = '';
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: widget.messages[index]['isUserMessage']
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!widget.messages[index]['isUserMessage']) // show profile picture for bot messages only
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/bot.jpg'),
                    radius: 32,
                  ),
                Container(
                  margin: EdgeInsets.only(
                    left: widget.messages[index]['isUserMessage'] ? 0 : 40,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomRight: Radius.circular(
                          widget.messages[index]['isUserMessage'] ? 0 : 16),
                      topLeft: Radius.circular(
                          widget.messages[index]['isUserMessage'] ? 16 : 0),
                    ),

                    // color: widget.messages[index]['isUserMessage']

                    color: widget.messages[index]['message'].text.text[0] == 'This is a Hate Speech'// check if this is the message you want to style differently
                        ? Color(0XFFF6CECE)
                        : widget.messages[index]['message'].text.text[0] == 'This is an Offensive Speech' // check if this is the message you want to style differently
                        ? Color(0XFFF2F5A9)
                        : widget.messages[index]['message'].text.text[0] ==
                        'This is a Safe Speech'
                        ? Color(0XFFCEF6CE) // set the background color to red if it is
                        : widget.messages[index]['isUserMessage']
                        ? Colors.white
                        : Colors.white.withOpacity(0.8),
                    border: Border.all(
                      color: widget.messages[index]['message'].text.text[0] == 'This is a Hate Speech'
                          ? Colors.red
                          : widget.messages[index]['message'].text.text[0] == 'This is an Offensive Speech' // check if this is the message you want to style differently
                          ? Color(0XFFDBA901)
                          : widget.messages[index]['message'].text.text[0] ==
                          'This is a Safe Speech'
                          ? Color(0XFF04B404)
                          : const Color(0xFF04B4AE),
                      width: 2,
                    ),
                  ),

                  constraints: BoxConstraints(maxWidth: w * 1.5/ 3),
                  child: Text(
                    widget.messages[index]['message'].text.text[0],
                    style: TextStyle(
                      color: widget.messages[index]['isUserMessage']
                          ? const Color(0xFF04B4AE)
                          : widget.messages[index]['message'].text.text[0] ==
                          'This is a Hate Speech'
                          ? Colors.red
                          : widget.messages[index]['message'].text.text[0] ==
                          'This is an Offensive Speech'
                          ? Color(0XFFDBA901)
                          : widget.messages[index]['message'].text.text[0] ==
                          'This is a Safe Speech'
                          ? Color(0XFF04B404)
                          : const Color(0xFF04B4AE),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => const Padding(padding: EdgeInsets.only(top: 0)),
        itemCount: widget.messages.length);
  }
}
