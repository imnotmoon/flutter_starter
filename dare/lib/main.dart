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
      home: Home(),
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
            BottomNavigationBarItem(icon: Icon(Icons.near_me), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
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
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCategory("assets/camping.jpeg", "Camping"),
                        SizedBox(
                          width: 20,
                        ),
                        buildCategory("assets/vacation.jpeg", "Vacation"),
                        SizedBox(
                          width: 20,
                        ),
                        buildCategory("assets/camping.jpeg", "camping")
                      ],
                    ))
              ]),
            ),
          ),
        ));
  }

  Container buildCategory(String imageUrl, String title) {
    return Container(
      width: 150,
      // color: Colors.red,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 0.7,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(imageUrl),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
