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
            // Benesse Title
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset('images/benesse_logo.png'),
                  width: 400.0,
//              height: 230.0,
                ),
                Icon(Icons.add),
              ],
            ),
//            Container(
//              height: 130,
//              child: DrawerHeader(
//                child: Center(
//                  child: Text(
//                    '＋ Benesse',
//                    style: TextStyle(
//                      fontSize: 50.0,
//                      fontWeight: FontWeight.w700,
//                      color: Colors.white,
////                        color: Color(0xffFF4502),
//                    ),
//                  ),
//                ),
//                decoration: BoxDecoration(
//                  color: Color(0xffFF4502),
////                  color: Color(0xff403F3E),
//                ),
//              ),
//            ),
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
                  color: Color(0xff9e9e9e),
                ),
              ),
            ),
            ListTile(
              title: Text("豊臣秀吉は織田信長の右腕!!?"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Container(
              child: Image.asset('images/Nobunaga.jpg'),
              width: 400.0,
              height: 230.0,
            ),
            ListTile(
              title: Text("豊臣秀吉の施策「太閤検地」とは"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Container(
              child: Image.asset('images/taikou.jpeg'),
              width: 400.0,
              height: 200.0,
            ),
            SizedBox(
              height: 90,
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
                  color: Color(0xff9e9e9e),
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
                color: Colors.orange[400],
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
                color: Colors.orange[400],
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
                color: Colors.orange[400],
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 90,
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
                  color: Color(0xff9e9e9e),
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
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}