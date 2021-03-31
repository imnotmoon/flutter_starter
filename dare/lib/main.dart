import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
                    BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
                    BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
                  ],
                ),
                body: Column(children: [
                  Text("가"),
                  Text("나"),
                  Row(
                    children: [
                      Expanded(child: TextField()),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.blueGrey,
                      )
                    ],
                  ),
                  Image.asset("assets/banner.jpeg"),
                  Text("다"),
                  Expanded(
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]))
                ]))));
  }
}
