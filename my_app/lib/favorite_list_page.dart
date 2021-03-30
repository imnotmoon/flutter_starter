import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoriteListPage extends StatelessWidget {
  final List<WordPair> _favorites;

  // 생성자 중괄호 안에 있는 내용은 optional
  const FavoriteListPage(this._favorites, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("this is a favorite page : " + _favorites.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          if (index < _favorites.length) {
            return _getRow(_favorites[index]);
          }
        }),
      ),
    );
  }
}

Widget _getRow(WordPair wordPair) {
  return Column(
    children: <Widget>[
      ListTile(
        title: Text(wordPair.asCamelCase),
      )
    ],
  );
}
