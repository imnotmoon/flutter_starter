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

  List<String> _chats = [];

  // AnimatedList의 상태를 저장하는 변수.
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();

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
          child: AnimatedList(
            key: _animListKey,
            reverse: true,
            itemBuilder: _buildItem,
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

  Widget _buildItem(context, index, animation) {
    // _handleSubmitted 함수는 _chats에 string을 넣어주는거고
    // _buildItem은 _chats에서 string을 꺼내서 ChatMessage로 만들어주는 함수
    return ChatMessage(_chats[index], animation: animation);
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    _textEditingController.clear();

    // AnimatedList를 사용할때는 key를 사용해서 state가 변한걸 알려준다.
    _chats.insert(0, text);
    _animListKey.currentState.insertItem(0);
  }
}
