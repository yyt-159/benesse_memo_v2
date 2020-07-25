import 'package:flutter/material.dart';
import 'benesse_drawer.dart';

class ShowScreen extends StatefulWidget {

  String memoTitle;
  String memoBody;

  ShowScreen({this.memoTitle, this.memoBody});

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.memoTitle),
        centerTitle: true,
      ),
      endDrawer: BenesseDrawer(),
      body: Center(
        child: Container(
          child: Text(widget.memoBody),
        ),
      )
    );
  }
}
