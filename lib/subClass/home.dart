import 'package:flutter/material.dart';

void main() => runApp(Home());
final List<String> items = ['물건A', '물건B', '물건C'];

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  _Home createState() => _Home();
}
class _Home extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
      appBar: AppBar(
        title: Text("나누리"),
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
      body: _topPage(),
      ),
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