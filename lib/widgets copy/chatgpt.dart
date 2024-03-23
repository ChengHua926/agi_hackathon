import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class Message {
  final String text;
  final bool isFromBot;

  Message(this.text, this.isFromBot);
}

List<Message> getMessages() {
  return [];
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = getMessages();
  ScrollController _scrollController = ScrollController();

  void _sendMessage(String text) async {
    setState(() {
      _messages.add(Message(text, false));
    });
    _controller.clear();

    // Add a delay
    await Future.delayed(Duration(seconds: 2));

    // Future<String> futureString = callOpenAI();
    String result;

    final response = await http.post(
      Uri.parse('http://localhost:3000/api/messages'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'message': 'dwdawda'}),
    );

    result = response.body;

    _messages.add(Message(result, true));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('年轻人的第一个理财老师'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Container(
                    alignment: message.isFromBot
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: message.isFromBot
                            ? Color.fromARGB(255, 54, 157, 222)
                            : Color.fromARGB(255, 147, 72, 223),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => _sendMessage('找几张团购券来'),
                      child: Container(
                        width: 180,
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(113, 33, 174, 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            '找几张团购券来',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _sendMessage('把我上周的餐饮消费写下来'),
                      child: Container(
                        width: 220,
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(113, 33, 174, 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            '把我上周的餐饮消费写下来',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(10.0),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.blueAccent),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: Text('Text 4'),
                    // ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => _sendMessage('把消费记录搞成表格'),
                      child: Container(
                        width: 190,
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(113, 33, 174, 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            '把消费记录搞成表格',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _sendMessage('给我搞个财务计划'),
                      child: Container(
                        width: 180,
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(113, 33, 174, 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            '给我搞个财务计划',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(10.0),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.blueAccent),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: Text('Text 4'),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: '输入你的消息',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onSubmitted: _sendMessage,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => _sendMessage(_controller.text),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
