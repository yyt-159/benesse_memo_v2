import 'package:flutter/material.dart';
import 'memo_temp.dart';
import 'keyword_temp.dart';


class MemoData extends ChangeNotifier {

  List<MemoTemp> memoStore = [
    MemoTemp(memoTitle: '織田信長',memoBody: '織田信長のメモが表示されます',photoName: ''),
    MemoTemp(memoTitle: '豊臣秀吉',memoBody: '豊臣秀吉のメモが表示されます',photoName: ''),
  ];

  List<KeywordTemp> keywordStore = [
    KeywordTemp(keywordName: '織田信長', noteId: []),
    KeywordTemp(keywordName: '豊臣秀吉', noteId: []),
  ];

  int get dataCount {
    return memoStore.length;
  }


  int get keywordCount{
    return keywordStore.length;
  }

  List getNoteIds(String name){
    for(int i=0;i<dataCount;i++){
      if(keywordStore[i].keywordName==name) return keywordStore[i].noteId;
    }

  }

  void registarKeyword(String name, int id){
    bool flag =false;
    for(int i=0;i<keywordCount;i++){
      if(keywordStore[i].keywordName==name){
        flag=true;
        keywordStore[i].noteId.add(id);

      }
    }
    if(flag==false){
      keywordStore.add(KeywordTemp(keywordName: name, noteId: [id]));
    }
    notifyListeners();
  }

  void addData (memoTitle,memoBody){
    final memo = MemoTemp(memoTitle: memoTitle,memoBody: memoBody);
    memoStore.add(memo);
    notifyListeners();
  }

}