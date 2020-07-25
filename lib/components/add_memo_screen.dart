import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo_data.dart';

class AddMemoScreen extends StatefulWidget {
  @override
  _AddMemoScreenState createState() => _AddMemoScreenState();
}

class _AddMemoScreenState extends State<AddMemoScreen> {

  String _addingMemoTitle;
  String _addingMemoBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規作成'),
        centerTitle: true,
      ),
      body: Padding(
        padding:EdgeInsets.only(top: 20.0,left: 20.0,right:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newMemoTitle){
                _addingMemoTitle = newMemoTitle;
              },
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newMemoBody){
                _addingMemoBody = newMemoBody;
              },
            ),
            FlatButton(
              child: Text(
                '追加',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<MemoData>(context, listen: false).addData(_addingMemoTitle,_addingMemoBody);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
