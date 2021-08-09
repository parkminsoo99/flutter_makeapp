import 'package:flutter/material.dart';
import './sale.dart';

void main() => runApp(My());

final Color color = Colors.green;
final Color buttonColor = Colors.white.withOpacity(0.6);
SaleState _sale = new SaleState();
class My extends StatefulWidget {
  My({Key? key}) : super(key: key);

  _My createState() => _My();
}

class _My extends State<My> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("나누리샵"),
          centerTitle: true,
          elevation: 6,
          leading: Text("동네이름"),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print("검색기능");
                }),
            IconButton(
              icon: Icon(Icons.layers),
              onPressed: () {
                print("카테고리기능");
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _topPage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  middleButton(
                      color, Icons.volunteer_activism, '나눔내역', context, _sale),
                  middleButton(
                      color, Icons.shopping_cart, '구매내역', context, _sale),
                  middleButton(color, Icons.loyalty, '관심목록', context, _sale),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  bottomButton(buttonColor, Icons.person, '프로필 보기'),
                  bottomButton(buttonColor, Icons.savings, '나누리 포인트'),
                  bottomButton(buttonColor, Icons.category, '관심 카테고리'),
                  bottomButton(buttonColor, Icons.settings, '설정'),
                  bottomButton(buttonColor, Icons.notifications, '공지사항'),
                  bottomButton(buttonColor, Icons.contact_phone, '고객센터'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
  }

  Column middleButton(
      Color color, IconData icon, String label, BuildContext context, test) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => test));
              },
              child: Column(
                children: [
                  Icon(icon, color: color),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 30),
                    child: Text(label, style: TextStyle(color: color)),
                  ),
                ],
              ),
            ),
          )
        ]);
  }

  Column bottomButton(
      Color buttonColor, IconData settingIcon, String settingText) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
            child: Container(
              color: buttonColor,
              height: 70,
              width: double.infinity,
              child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Icon(settingIcon),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Text(settingText),
                ),
              ]),
            ),
            onTap: () {
             print("123");
            }),
      ],
    );
  }
}
