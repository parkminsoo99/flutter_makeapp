import 'package:flutter/material.dart';

void main() => runApp(Sale());

class Sale extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SaleState(),
    );
  }
}

class SaleState extends StatefulWidget {
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<SaleState> {
  int _selectedIndex = 0;

  static List<String> items = ['A', 'B', 'C'];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,

        child: Scaffold(
          appBar: AppBar(
            title: Text("MainApp"),
            centerTitle: true,
            elevation: 6,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
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
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text("나눔중"),
                ),
                Tab(
                  child: Text("예약중"),
                ),
                Tab(
                  child: Text("나눔 완료"),
                ),
              ],
            ),
          ), //appBar

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
          ), //bottomNavigationBar

          body: TabBarView(
            children: <Widget>[
              Tab(child: itemlist()),
              Tab(child: itemlist()),
              Tab(child: itemlist()),
            ],
          ),
        ), //Scaffold
      ),
    );
  }

  Widget itemlist() {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () => {print('${items[index]}')},
          title: Text("${items[index]}"),
        );
      },
    );
  }
}
