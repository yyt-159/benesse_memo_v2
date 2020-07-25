import 'package:flutter/material.dart';
import 'memo_temp.dart';
import 'keyword_temp.dart';
class MemoData extends ChangeNotifier {
  int memoId = 1;
  List<MemoTemp> memoStore = [
    MemoTemp(memoTitle: '織田信長',memoBody: '織田信長のメモが表示されます',photoName: '',keywordsId: [1]),
    MemoTemp(memoTitle: '豊臣秀吉',memoBody: '豊臣秀吉のメモが表示されます',photoName: '',keywordsId: [2]),
  ];
  List<KeywordTemp> keywordStore = [
    KeywordTemp(keywordName: '豊臣秀吉', noteId: [2], keywordId: 1),
    KeywordTemp(keywordName: '織田信長', noteId: [1], keywordId: 2),
    KeywordTemp(keywordName: '戦国時代', noteId: [1,2], keywordId: 3)
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
  List getKeywordIds(String name){
    for(int i=0;i<keywordCount;i++){
      if(memoStore[i].memoTitle==name) return memoStore[i].keywordsId;
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
      keywordStore.add(KeywordTemp(keywordName: name, noteId: [id], keywordId: keywordCount));
    }
    notifyListeners();
  }
  void addData (memoTitle,memoBody,photoName,memoId, keywordsId){
    final memo = MemoTemp(memoTitle: memoTitle,memoBody: memoBody, photoName:photoName,memoId: memoId, keywordsId: keywordsId);
    memoStore.add(memo);
    notifyListeners();
  }
}