import 'package:flutter/material.dart';

void main() => runApp(Chat());
final List<String> items = ['물건A', '물건B', '물건C'];

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  _Chat createState() => _Chat();
}

class _Chat extends State<Chat> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("채팅"),
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
        body: ListView.separated(
            padding: EdgeInsets.all(8),
            itemCount: items.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => {print('${items[index]}')},
                title: Text('${items[index]}'),
              );
            }),
      ),
    );
  }
}
