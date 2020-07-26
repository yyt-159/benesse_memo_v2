import 'package:flutter/material.dart';
import 'components/memo_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_benesse_memo/components/memo_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemoData>(
      create: (context) => MemoData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xffF6F5EF),
          accentColor: Color(0xffFF4502),
//            colorScheme:Color(0xff403F3E),
        ),
        home: MemoScreen(),
      ),
    );
  }
}
