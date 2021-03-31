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
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 휴대폰 크기를 알고있는 size 객체
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Align(
              child: Text(
                "Friday, Febuary 21",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              child: Text("Go to the vacation",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              alignment: Alignment.centerLeft,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search anything...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 1.5 / 1,
                child: Image.asset(
                  "assets/banner.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text("다"),
            Expanded(
                child: ListView(scrollDirection: Axis.horizontal, children: [
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
          ]),
        ));
  }
}
