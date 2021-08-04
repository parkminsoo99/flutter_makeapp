import 'package:flutter/material.dart';
import './sale.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home : My(),
    );
  }
}

//MY_Class => 나의 정보
class My extends StatefulWidget{
  My({Key ? key}) : super(key:key);

  _My createState () => _My();
}

class _My extends State<My> {
  static const Color color = Colors.green;

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _topPage(),
      _middlePage(),
    ]);
  }

  Widget _topPage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: GestureDetector(
            onTap: () {
              print("click"); //이미지 등록
            },
            child: Container(
              child: Icon(Icons.account_circle, size: 100),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: GestureDetector(
                  onTap: () {
                    print("clickname");
                  },
                  child: Container(
                    color: Colors.red,
                    child: Text("닉네임 : "),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () {
                    print("clickaddress");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    color: Colors.yellow,
                    child: Text("주소 : "),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } //My 프로필

  Widget _middlePage() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      middleButton(color, Icons.volunteer_activism, '나눔내역'),
      middleButton(color, Icons.shopping_cart, '구매내역'),
      middleButton(color, Icons.loyalty, '관심목록'),
    ]);
  }
}

Column middleButton(Color color, IconData icon, String label,) {
  return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          child: GestureDetector(
            onTap: () {
              setState((){

              });
            },
            child: Column(
              children: [
                Icon(icon, color: color),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(label, style: TextStyle(color: color)),
                ),
              ],
            ),
          ),
        )
      ]);
}