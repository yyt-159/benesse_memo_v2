import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo_data.dart';
import 'memo_tile.dart';
import 'memo_show_screen.dart';

class SearchList extends StatelessWidget {
  String keyword;

  SearchList({this.keyword});

  List<int> noteIds=[];

  @override
  Widget build(BuildContext context) {
    noteIds = Provider.of<MemoData>(context, listen: false).getNoteIds(keyword);
    print(noteIds);
    int listlength = noteIds.length;
    return Consumer<MemoData>(
      builder: (context, memoData, child){
        return Padding(
          padding: EdgeInsets.only(top: 20.0, right: 30.0, bottom: 30.0, left: 30.0),
          child: ListView.builder(itemBuilder: (context, index) {
            return FlatButton(
              color: Colors.white,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowScreen(
                      memoTitle:memoData.memoStore[noteIds[index]-1].memoTitle,
                      memoBody: memoData.memoStore[noteIds[index]-1].memoBody,
                      photoName:memoData.memoStore[index-1].photoName,
                      keywordIds: memoData.memoStore[index-1].keywordsId,
                      memoId: memoData.memoStore[index-1].memoId
                    )));
              },
              child: MemoTile(
                memoTitle: memoData.memoStore[noteIds[index]-1].memoTitle,
              ),
            );
          },itemCount: listlength,
          ),
        );
      },
    );
  }
}
