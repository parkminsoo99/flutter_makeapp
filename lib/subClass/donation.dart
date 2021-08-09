import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//분야별기부단체 API 호출
List data = [];

class Post {
  final String? adres; //주소
  final String? dmstcTelno; //전화번호
  final String? hmpgByid; //홈페이지 주소
  final String? nanmbyNm; //기부단체이름
  final String? rcritRealm; //분야
  Post(
      {this.adres,
      this.dmstcTelno,
      this.hmpgByid,
      this.nanmbyNm,
      this.rcritRealm});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      adres: json['adres'],
      dmstcTelno: json['adstcTelno'],
      hmpgByid: json['hmpgByid'],
      nanmbyNm: json['nanmbyNm'],
      rcritRealm: json['rcritRealm'],
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(Uri.parse('http://openapi.1365.go.kr/openapi/'
      'service/rest/ContributionGroupService/'
      'getCntrCategoryGrpList?serviceKey='
      '18s%2BB50tjzpz3fb6K9W3KAo9asQ7eXtSX16oFMBs%2BzBpUxJRUVX6Sx5QxiSQ8CXQMowMIHe%2BK5MAekcMLcVuzw%3D%3D&'));

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load pose');
  }
}

void main() => runApp(DonationPage());

class DonationPage extends StatefulWidget {
  DonationPage({Key? key}) : super(key: key);

  @override
  _DonationPage createState() => _DonationPage();
}

class _DonationPage extends State<DonationPage> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("기부"),
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
        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Text(data[index]["title"]),
            );
          },
        ),
      ),
    );
  }
}