import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  String _addingMemoBody;

  // テキストフィールドの管理用コントローラを作成
  final myController = TextEditingController();

  // データ格納用リスト
  List<Map<String, dynamic>> items = [];
  // Keywordに入力された言葉を追加する
  void addKeyword(String inputkeyword) {
    setState(() {
      _counter++;
      items.add({"id": _counter, "title": inputkeyword});
    });
  }

  //　上記リストのカウント変数（ID用）
  int _counter = 0;

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  File _image;
  String _imagePathName;
  // インスタンス生成
  final ImagePicker picker = ImagePicker();

  void selectImage() async {
    print('push button');

    // アルバムから読み込み
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imagePathName = pickedFile.path;
    } else {
      print('Error');
    }
    var savedFile = await FileController.saveLocalImage(_image); //追加
    setState(() {
      this._image = savedFile; //変更
    });
  }

  @override
  Widget build(BuildContext context) {
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
              ],
            ), // Title
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
                            color: Colors.lightBlueAccent,
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
            ), // Body（Image）
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
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
              ],
            ), // Memo
            SizedBox(
              height: 25,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.link),
                      hintText: 'ADD  # hash tag !',
                    ),
                    controller: myController,
//                    autofocus: true,
//                    textAlign: TextAlign.center,
//                    onChanged: (newMemoBody) {
//                      _addingMemoBody = newMemoBody;
//                    },
                  ),
                ),
                FlatButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    addKeyword(myController.text);
                    // テキストフィールドの内容をクリア
                    myController.clear();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];
                    return new Card(
                      child: ListTile(
//                        leading: Icon(Icons.link),
                        title:
//                            Text(item["id"].toString() + ":  " + item["title"]),
                            Text("　＃  " + item["title"]),
                      ),
                    );
                  }),
            ),
            FlatButton(
              child: Text(
                'CREATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                int _memoId =
                    Provider.of<MemoData>(context, listen: false).memoId;
                Provider.of<MemoData>(context, listen: false)
                    .addData(_addingMemoTitle, _addingMemoBody, '', _memoId);
                Provider.of<MemoData>(context, listen: false).memoId++;
                print(Provider.of<MemoData>(context, listen: false).memoId);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
