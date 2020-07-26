import 'package:flutter/material.dart';
import 'style.dart';

class MemoTile extends StatelessWidget {
  final String memoTitle;

  MemoTile({this.memoTitle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(memoTitle,
          style: kLargeTextStyle),
    );
  }
}