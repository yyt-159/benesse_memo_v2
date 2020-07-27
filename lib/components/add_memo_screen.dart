import 'package:flutter/material.dart';
import 'package:flutter_benesse_memo/components/keyword_temp.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'memo_data.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'image_file_controller.dart';
// 表示用の書式設定
const kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.black,
);
class AddMemoScreen extends StatefulWidget {
  @override
  _AddMemoScreenState createState() => _AddMemoScreenState();
}
class _AddMemoScreenState extends State<AddMemoScreen> {
  String _addingMemoTitle;
  String _addingMemoBody = '';
  // テキストフィールドの管理用コントローラを作成
  final myController = TextEditingController();
  // データ格納用リスト
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> keyIds = [];
  List<int> Ids =[];
  // Keywordに入力された言葉を追加する
  void addKeyword(String inputkeyword) {
    final prov = Provider.of<MemoData>(context, listen: false);
    int loopcount = prov.keywordCount;
    int keyId;
    bool flag = false;
    for (int i = 0; i < loopcount; i++) {
      if (prov.keywordStore[i].keywordName == inputkeyword) {
        keyId = prov.keywordStore[i].keywordId;
        keyIds.add({"keyid": keyId, "keyname": inputkeyword});
        Ids.add(keyId);
        flag = true;
      }
    }

    if(flag==false){
      prov.keywordStore.add(
          KeywordTemp(
              keywordName: inputkeyword,
              keywordId: loopcount,
              noteId: [prov.dataCount]
          )
      );
      Ids.add(keyId);
    }
    setState(() {
      _counter++;
      items.add({"id": _counter, "title": inputkeyword});
    });
  }
  //　上記リストのカウント変数（ID用）
  int _counter = 0;
  var _textFieldFocusNode;
  var _inputController = TextEditingController();
  var _chipList = List<Chip>();
  var _keyNumber = 0;
  @override
  void initState() {
    _textFieldFocusNode = FocusNode();
    super.initState();
  }
  void _addChip(String text) {
    var chipKey = Key('chip_key_$_keyNumber');
    _keyNumber++;
    _chipList.add(
      Chip(
        key: chipKey,
        label: Text(text),
        onDeleted: () => _deleteChip(chipKey),
      ),
    );
  }
  void _deleteChip(Key chipKey) {
    setState(() => _chipList.removeWhere((Widget w) => w.key == chipKey));
  }
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    myController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }
  void _onSubmitted(String text) {
    setState(() {
      _inputController.text = '';
      _addChip(text);
      addKeyword(text);
      FocusScope.of(context).requestFocus(_textFieldFocusNode);
    });
  }
  File _image;
  String _imagePathName = '';
  // インスタンス生成
  final ImagePicker picker = ImagePicker();
  void selectImage() async {
    //print('push button');
    // アルバムから読み込み
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imagePathName = pickedFile.path;
    } else {
      print('Error');
    }
    var savedFile = await FileController.saveLocalImage(_image); //追加
    //_image = savedFile;
    setState(() {
      this._image = savedFile; //変更
    });
  }
  @override
  Widget build(BuildContext context) {
    print('$_imagePathName');
    return Scaffold(
      appBar: AppBar(
        title: Text('NEW NOTEBOOK'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.title),
                        hintText: 'MEMO TITLE *',
                      ),
                      onChanged: (newMemoTitle) {
                        _addingMemoTitle = newMemoTitle;
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Title
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.import_contacts),
                SizedBox(
                  width: 30,
                ),
                //画像をストレージから挿入
                Container(
                    child: (_image == null)
                        ? FlatButton(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Color(0xffFF4502),
                      onPressed: () {
                        selectImage();
                      },
                    )
                        : FlatButton(
                      onPressed: () {
                        selectImage();
                      },
                      child: Image.memory(
                        _image.readAsBytesSync(),
                        width: 200.0,
                        height: 200.0,
                      ),
                    )),
              ],
            ),
            // Body（Image）
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.insert_comment),
                        hintText: '+α memo',
                      ),
                      onChanged: (newMemoBody) {
                        _addingMemoBody = newMemoBody;
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Memo
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              child: TextField(
                focusNode: _textFieldFocusNode,
                autofocus: true,
                controller: _inputController,
                decoration: InputDecoration(
                  icon: Icon(Icons.link),
                  hintText: 'ADD  # hash tag !',
                ),
                onSubmitted: _onSubmitted,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8.0,
                    runSpacing: 0.0,
                    direction: Axis.horizontal,
                    children: _chipList,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Text(
                'CREATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Color(0xffFF4502),
              onPressed: () {
                int _memoId =
                    Provider.of<MemoData>(context, listen: false).dataCount+1;
                for (int i = 0; i < keyIds.length; i++) {
                  Provider.of<MemoData>(context, listen: false)
                      .registarKeyword(keyIds[i]['keyname'], _memoId);
                }
                Provider.of<MemoData>(context, listen: false).addData(
                    _addingMemoTitle,
                    _addingMemoBody,
                    _imagePathName,
                    _memoId,
                    Ids);
                Provider.of<MemoData>(context, listen: false).memoId++;
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}