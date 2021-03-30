import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import './word_list_page.dart';
import './favorite_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();

    return MaterialApp(
      // 보통 Scaffold를 기준으로 페이지를 결정한다.
      // WordListPage를 분리한다.
      home: WordListPage(),
    );
  }
}
