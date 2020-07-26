import 'package:flutter/material.dart';
import 'package:flutter_benesse_memo/components/memo_data.dart';
import 'benesse_drawer.dart';
import 'dart:io';
import 'style.dart';
import 'package:provider/provider.dart';
import 'search_keyword.dart';
import 'keyword_list_show.dart';

class ShowScreen extends StatefulWidget {
  String memoTitle;
  String memoBody;
  String photoName;
  List<int> keywordIds;
  int memoId;

  ShowScreen(
      {this.memoTitle,
      this.memoBody,
      this.photoName,
      this.keywordIds,
      this.memoId});

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    var _textFieldFocusNode;
    var _inputController = TextEditingController();
    List<int> keywordIds = widget.keywordIds;
    var _keywordList = List<FlatButton>();
    final prov = Provider.of<MemoData>(context);

    var _keyNumber = 0;

//    void initState() {
//    _textFieldFocusNode = FocusNode();
//    super.initState();
//    }
    void _deleteChip(Key chipKey) {
      setState(() => _keywordList.removeWhere((Widget w) => w.key == chipKey));
    }

    void _addChip(String text) {
      var chipKey = Key('chip_key_$_keyNumber');
      _keyNumber++;
      _keywordList.add(
        FlatButton(
          color: Colors.grey,
          //key: chipKey,
          child: Text('#' + text),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => KeywordScreen(keyword: text)));
          },
        ),
      );
    }

    for (int i = 0; i < keywordIds.length; i++) {
      for (int j = 0; j < prov.keywordCount; j++) {
        if (prov.keywordStore[j].keywordId == keywordIds[i]) {
          _addChip(prov.keywordStore[j].keywordName);
        }
      }
    }

    // widgetの破棄時にコントローラも破棄する
    void dispose() {
      myController.dispose();
      _textFieldFocusNode.dispose();
      super.dispose();
    }

    void _onSubmitted(String text) {
      prov.registarKeyword(text, widget.memoId);
      setState(() {
        _inputController.text = '';
        _addChip(text);
        FocusScope.of(context).requestFocus(_textFieldFocusNode);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.memoTitle,
          style: kLargeTextStyle,
        ),
        centerTitle: true,
      ),
      endDrawer: BenesseDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            //SizedBox(height: 40.0),
            //用意でき次第Image.asset(photoName)に変更

            Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                child:
                    (widget.memoTitle == '豊臣秀吉' || widget.memoTitle == '織田信長')
                        ? Image.asset('${widget.photoName}')
                        : Image.memory(
                            File(widget.photoName).readAsBytesSync(),
                          )),
            SizedBox(height: 40.0),
            Text(widget.memoBody),
            //用意でき次第keywordを表示させるWidgetに変更

            Expanded(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 0.0,
                direction: Axis.horizontal,
                children: _keywordList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
