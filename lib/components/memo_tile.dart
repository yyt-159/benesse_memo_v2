import 'package:flutter/material.dart';
import 'style.dart';

class MemoTile extends StatelessWidget {
  final String memoTitle;
  final Function callbackEditScreen;

  MemoTile({this.memoTitle, this.callbackEditScreen});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(memoTitle,
        style: kLargeTextStyle),
    );
  }
}