import 'package:flutter/material.dart';
import 'search_keyword.dart';
import 'add_memo_screen.dart';
import 'style.dart';

class KeywordScreen extends StatelessWidget {

  String keyword;

  KeywordScreen({this.keyword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(keyword+'を含むノート一覧', style: kLargeTextStyle),
        centerTitle: true,
      ),
      body:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
        ),
        child: SearchList(keyword: keyword),
      ),
    );
  }
}
