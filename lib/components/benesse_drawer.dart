import 'package:flutter/material.dart';

class BenesseDrawer extends StatefulWidget {
  @override
  _BenesseDrawerState createState() => _BenesseDrawerState();
}

class _BenesseDrawerState extends State<BenesseDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text('ここだけ押さえよう！（仮）',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
                ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
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
//          ListTile(
//            title: Text("ボタン"),
//            trailing: Icon(Icons.arrow_forward),
//          ),
        ],
      ),
    );
  }
}
