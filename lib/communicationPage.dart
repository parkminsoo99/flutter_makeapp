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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  categories(color, Icons.home, '전체'),
                  SizedBox(height:70),
                  categories(color, Icons.home, '전체'),
                  SizedBox(height:70),
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
                  SizedBox(height:70),
                  categories(color, Icons.home, '전체'),
                  SizedBox(height:70),
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
