import 'package:flutter/material.dart';
import 'memo_list.dart';
import 'add_memo_screen.dart';

class MemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('日本史'),
          centerTitle: true,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddMemoScreen()
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent.shade200,
        child: Icon(Icons.add),
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
