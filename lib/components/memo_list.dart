import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo_data.dart';
import 'memo_tile.dart';
import 'memo_show_screen.dart';
class MemoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MemoData>(
      builder: (context, memoData, child) {
        return Padding(
          padding:
          EdgeInsets.only(top: 20.0, right: 30.0, bottom: 30.0, left: 30.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return RaisedButton(
                padding: EdgeInsets.only(top: 20,left: 20,bottom: 20,right: 20),
                color: Color(0xffF6F5EF),
                elevation: 16.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowScreen(
                            memoTitle: memoData.memoStore[index].memoTitle,
                            memoBody: memoData.memoStore[index].memoBody,
                            photoName: memoData.memoStore[index].photoName,
                            keywordIds:
                            memoData.memoStore[index].keywordsId,
                            memoId: memoData.memoStore[index].memoId,
                          )));
                },
                child: MemoTile(
                  memoTitle: memoData.memoStore[index].memoTitle,
                ),
              );
            },
            itemCount: memoData.dataCount,
          ),
        );
      },
    );
  }
}