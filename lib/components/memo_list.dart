import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo_data.dart';
import 'memo_tile.dart';
import 'memo_edit_screen.dart';

class MemoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MemoData>(
      builder: (context, memoData, child){
        return Padding(
          padding: EdgeInsets.only(top: 20.0, right: 30.0, bottom: 30.0, left: 30.0),
          child: ListView.builder(itemBuilder: (context, index) {
            return RaisedButton(
              onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditScreen()));
              },
              child: MemoTile(
                memoTitle: memoData.memoStore[index].memoTitle,
              ),
            );
          },itemCount: memoData.dataCount,),
        );
      },
    );
  }
}
