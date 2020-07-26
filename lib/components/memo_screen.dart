import 'package:flutter/material.dart';
import 'memo_list.dart';
import 'add_memo_screen.dart';
import 'style.dart';

class MemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('日本史', style: kLargeTextStyle),
          centerTitle: true,
        ),
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          backgroundColor: Color(0xffFF4502),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AddMemoScreen()
              ),
            );
          },
          child: Icon(Icons.add,size: 50,),
        ),
      ),
        body:Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            child: MemoList(),
          ),
        );
  }
}
