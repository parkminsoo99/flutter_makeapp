import 'package:flutter/material.dart';
import 'subClass/donation.dart';
import 'subClass/communicationPage.dart';
import 'subClass/chat.dart';
import 'subClass/my.dart';
import 'subClass/home.dart';

void main() => runApp(MaterialApp(title: 'MyApp', home: MainPage()));

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  _PageZero createState() => _PageZero();
}

//로그인 후 들어왔을 때 화면

class _PageZero extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> screenList = <Widget>[
    Home(),
    Communication(),
    Chat(),
    DonationPage(),
    My(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
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
