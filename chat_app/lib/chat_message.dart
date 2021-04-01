import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(this.txt, {Key key, @required this.animation})
      : super(key: key);

  final String txt;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        axisAlignment: -1.0,
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                child: Text("N"),
                backgroundColor: Colors.blueGrey,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
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
            ],
          ),
          SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
