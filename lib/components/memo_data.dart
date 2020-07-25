import 'package:flutter/material.dart';
import 'memo_temp.dart';


class MemoData extends ChangeNotifier {

  List<MemoTemp> memoStore = [
    MemoTemp(memoTitle: '織田信長',memoBody: '織田信長の資料が表示されます'),
    MemoTemp(memoTitle: '豊臣秀吉',memoBody: '豊臣秀吉の資料が表示されます'),
  ];

  int get dataCount {
    return memoStore.length;
  }

}