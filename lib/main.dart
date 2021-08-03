import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'MyApp', home: MainPage()));

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  _PageZero createState() => _PageZero();
}

class _PageZero extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> screenList = <Widget>[
    Home(),
    Login(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainApp"),
        centerTitle: true,
        elevation: 6,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: null),
          IconButton(icon: Icon(Icons.login), onPressed: null),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'My'),
        ],
      ),
      body: screenList[_selectedIndex],
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _pageOfTop(),
    ]);
  }

  Widget _pageOfTop() {
    return Text('pageOftop');
  }
}

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("click"); //이미지 등록
      },
      child: Container(
        alignment: Alignment(-0.8, -0.8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.account_circle, size: 150),
            Text("닉네임 : "),
          ],
        ),
      ),
    );
  }
}
