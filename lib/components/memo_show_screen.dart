import 'package:flutter/material.dart';
import 'benesse_drawer.dart';
import 'dart:io';
import 'style.dart';

class ShowScreen extends StatefulWidget {
  String memoTitle;
  String memoBody;
  String photoName;

  ShowScreen({this.memoTitle, this.memoBody, this.photoName});

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.memoTitle,
          style: kLargeTextStyle,),
        centerTitle: true,
      ),
      endDrawer: BenesseDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            //用意でき次第Image.asset(photoName)に変更
            Container(
                child: (widget.memoTitle == '豊臣秀吉')
                    ? Image.asset('${widget.photoName}')
                    : Image.memory(
                  File(widget.photoName).readAsBytesSync(),
                )),
            SizedBox(height: 40.0),
            Text(widget.memoBody),
            //用意でき次第keywordを表示させるWidgetに変更
          ],
        ),
      ),
    );
  }
}

