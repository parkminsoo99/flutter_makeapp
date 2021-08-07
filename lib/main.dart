import 'package:flutter/material.dart';
import './sale.dart';
void main() => runApp(MaterialApp(title: 'MyApp', home: MainPage()));

final List<String> items = ['물건A', '물건B', '물건C'];

final Color color = Colors.green;

final Color buttonColor = Colors.white.withOpacity(0.6);

SaleState Sale = new SaleState();

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  _PageZero createState() => _PageZero();
}

//로그인 후 들어왔을 때 화면

class _PageZero extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> screenList = <Widget>[
    Home(),
    Community(),
    Chat(),
    Donation(),
    My(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainApp"),
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
          IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                print("로그인기능");
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '나눔'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: '기부'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'My'),
        ],
      ),
      body: screenList[_selectedIndex],
    );
  }
}

//Home_Class => 실제 물건 등록화면

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: _topPage(),
    );
  }

  Widget _topPage() {
    return ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => {print('${items[index]}')},
            title: Text('${items[index]}'),
          );
        });
  }
}

class Community extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("test1"),
    );
  }
}

//Chat_Class => 채팅 기록

class Chat extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => {print('${items[index]}')},
            title: Text('${items[index]}'),
          );
        });
  }
}

//Donation_Class => 기부 카테고리

class Donation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("test1"),
    );
  }
}

//MY_Class => 나의 정보

class My extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _topPage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              middleButton(color, Icons.volunteer_activism, '나눔내역', context, Sale),
              middleButton(color, Icons.shopping_cart, '구매내역', context, Sale),
              middleButton(color, Icons.loyalty, '관심목록', context, Sale),
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
              print('test1');
            }),
      ],
    );
  }
}

