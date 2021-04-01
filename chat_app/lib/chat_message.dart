import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(this.txt, {Key key}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Text("N"),
          backgroundColor: Colors.blueGrey,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ID or Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(this.txt),
              ],
            ),
          ),
        )
      ],
    );
  }
}
