import 'package:flutter/material.dart';
import './My.dart';

void main() => runApp(MaterialApp(title: 'MyApp', home: MainPage()));

const List<String> items = ['물건A', '물건B', '물건C'];

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  _PageZero createState() => _PageZero();

}
//로그인 후 들어왔을 때 화면

class _PageZero extends State<MainPage> {
  My CreateState () => My();
  int _selectedIndex = 0;

  List<Widget> screenList = <Widget>[
    Home(),
    Chat(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
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


