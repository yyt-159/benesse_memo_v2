import 'package:flutter/material.dart';
import 'memo_list.dart';

class MemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          showModalBottomSheet(context: context, builder: (context) => AddMemoScreen());
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
