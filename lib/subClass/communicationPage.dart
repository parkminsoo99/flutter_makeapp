import 'package:flutter/material.dart';

void main() => runApp(Communication());

const color = Colors.red;

class Communication extends StatefulWidget {
  Communication({Key? key}) : super(key: key);

  _Communication createState() => _Communication();
}

class _Communication extends State<Communication> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("나누니동네"),
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  categories(color, Icons.home, '전체'),
                  SizedBox(height: 70),
                  categories(color, Icons.home, '전체'),
                  SizedBox(height: 70),
                  categories(color, Icons.home, '전체'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  categories(color, Icons.home, '전체'),
                  SizedBox(height: 70),
                  categories(color, Icons.home, '전체'),
                  SizedBox(height: 70),
                  categories(color, Icons.home, '전체'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  categories(color, Icons.home, '전체'),
                  SizedBox(height: 70),
                  categories(color, Icons.home, '전체'),
                  SizedBox(height: 70),
                  categories(color, Icons.home, '전체'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Column categories(Color color, IconData icons, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            print("go");
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Icon(icons, color: color, size: 60),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
