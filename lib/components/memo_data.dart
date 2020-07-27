import 'package:flutter/material.dart';
import 'memo_temp.dart';
import 'keyword_temp.dart';

class MemoData extends ChangeNotifier {
  int memoId = 1;

  List<MemoTemp> memoStore = [
    MemoTemp(
        memoTitle: '織田信長',
        memoBody: '織田信長のメモが表示されます',
        photoName: 'images/Nobunaga.jpg',
        keywordsId: [2, 3],
        memoId: 1),
    MemoTemp(
        memoTitle: '豊臣秀吉',
        memoBody: '7月26日　4時間目　日本史\n豊臣秀吉について(教科書65ページ「安土桃山時代を知る」)',
        photoName: 'images/hideyoshi_note.png',
        keywordsId: [1, 3],
        memoId: 2),
    
  ];
  List<KeywordTemp> keywordStore = [
    KeywordTemp(keywordName: '豊臣秀吉', noteId: [2], keywordId: 1),
    KeywordTemp(keywordName: '織田信長', noteId: [1], keywordId: 2),
    KeywordTemp(keywordName: '戦国時代', noteId: [1, 2], keywordId: 3)
  ];
  int get dataCount {
    return memoStore.length;
  }

  int get keywordCount {
    return keywordStore.length;
  }

  List getNoteIds(String name) {
    for (int i = 0; i < keywordCount; i++) {
      if (keywordStore[i].keywordName == name) return keywordStore[i].noteId;
    }
  }

  List getKeywordIds(String name) {
    for (int i = 0; i < dataCount; i++) {
      if (memoStore[i].memoTitle == name) return memoStore[i].keywordsId;
    }
  }

  void registarKeyword(String name, int id) {
    bool flag = false;
    for (int i = 0; i < keywordCount; i++) {
      if (keywordStore[i].keywordName == name) {
        flag = true;
        keywordStore[i].noteId.add(id);
      }
    }
    if (flag == false) {
      keywordStore.add(KeywordTemp(
          keywordName: name, noteId: [id], keywordId: keywordCount));
    }
    notifyListeners();
  }

  void addData(memoTitle, memoBody, photoName, memoId, keywordsId) {
    print(memoId);
    print(keywordsId);
    final memo = MemoTemp(
        memoTitle: memoTitle,
        memoBody: memoBody,
        photoName: photoName,
        keywordsId: keywordsId,
        memoId: memoId,
        );
    memoStore.add(memo);
    notifyListeners();
  }
}
