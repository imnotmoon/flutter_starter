import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello My First App"),
        ),
        body: Center(child: RandomWords()),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> words = [];
  Set<WordPair> saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // 리스트 원소가 하나씩 만들어질때마다 itemBuilder 함수가 호출.
      itemBuilder: (BuildContext context, int index) {
        if (index >= words.length) {
          // 인덱스가 같으면 단어를 10개 추가
          // 다음 listItem부터 10번째 item까지는 인덱스가 더 작기 때문에 여기 안들어옴
          words.addAll(generateWordPairs().take(10));
        }
        // 아래 위젯을 생성.
        // print(words[index]);
        return _getRow(words[index]);
      },
    );
  }

  Widget _getRow(WordPair wordPair) {
    bool _isAlreadySaved = saved.contains(wordPair);
    // 여기서 wordPair는 word[index].
    // 단어 하나
    return Column(
      children: <Widget>[
        ListTile(
            onTap: () {
              // stateful widget : setState()를 실행하면 다시 render
              //
              setState(() {
                if (_isAlreadySaved) {
                  saved.remove(wordPair);
                } else {
                  saved.add(wordPair);
                }
              });
              print(saved.toString());
            },
            title: Text(
              wordPair.asCamelCase,
              textScaleFactor: 1.3,
              // style: TextStyle(fontSize: 10),
            ),
            trailing: Icon(
                _isAlreadySaved ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent)),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
          height: 5, // padding이라고 보면 된다.
          indent: 16,
          endIndent: 16,
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
