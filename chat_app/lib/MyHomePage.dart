import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Application"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: "Send a Message"),
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                child: Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
