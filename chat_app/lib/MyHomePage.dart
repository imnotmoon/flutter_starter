import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import './chat_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController를 통해서 텍스트필드를 컨트롤 할 수 있음.
  TextEditingController _textEditingController = TextEditingController();

  List<ChatMessage> _chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Application"),
      ),
      body: Column(children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) {
              return _chats[index];
            },
            itemCount: _chats.length,
          ),
        )),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: "Send a Message"),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                  child: Text("Send"),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    _textEditingController.clear();
    setState(() {
      _chats.insert(0, new ChatMessage(text));
    });
  }
}
