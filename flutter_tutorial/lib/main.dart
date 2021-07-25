import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('플러터 튜토리얼')),
            body: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Text(
                      "$counter",
                      style: TextStyle(fontSize: 160),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              increaseCounter();
                            },
                            child: Text("Add",
                                style: TextStyle(color: Colors.white))),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                          onPressed: () {
                            decreaseCounter(); 
                          },
                          child: Text("Substract", style: TextStyle(color:Colors.white)),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
