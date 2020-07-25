import 'package:flutter/material.dart';
class BenesseDrawer extends StatefulWidget {
  @override
  _BenesseDrawerState createState() => _BenesseDrawerState();
}
// ベネッセの推薦問題　データ格納用リスト
// [0]:問題文、　[1-3]選択肢
List<String> question_items = [
  "秀吉が刀狩をおこなった主な理由は何か。",
  "１：武器を自分の家来に分け与えるため",
  "2:百姓が武装して一揆することを防ぐため",
  "3:戦国時代を終わらせるため",
];
class _BenesseDrawerState extends State<BenesseDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            // (1)　画像
            Container(
              height: 80,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    '関連画像',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text("織田信長は生きていた、、？"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("本能寺の変の謎"),
              trailing: Icon(Icons.arrow_forward),
            ),
            SizedBox(
              height: 30,
            ),
            // (2)　問題
            Container(
              height: 80,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    'ここで１問',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(title: Text(question_items[0])),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: FlatButton(
                child: Text(
                  question_items[1],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: FlatButton(
                child: Text(
                  question_items[2],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: FlatButton(
                child: Text(
                  question_items[3],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // (3)　ポイント
            Container(
              height: 80,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    'ここだけおさえよう！',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text("織田信長は生きていた、、？"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("本能寺の変の謎"),
              trailing: Icon(Icons.arrow_forward),
            ),
            SizedBox(
              height: 50,
            ),
//          ListTile(
//            title: Text("ボタン"),
//            trailing: Icon(Icons.arrow_forward),
//          ),
          ],
        ),
      ),
    );
  }
}