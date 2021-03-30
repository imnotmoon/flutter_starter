import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_app/favorite_list_page.dart';

// file 한정 private
Set<WordPair> _saved = Set<WordPair>();

class WordListPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello My First App"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print("clicked action button!");
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return FavoriteListPage(_saved.toList());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavoriteListPage(_saved.toList())));
            })
      ]),
      body: Center(child: RandomWords()),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> words = [];

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
    bool _isAlreadySaved = _saved.contains(wordPair);
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
                  _saved.remove(wordPair);
                } else {
                  _saved.add(wordPair);
                }
              });
              print(_saved.toString());
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
