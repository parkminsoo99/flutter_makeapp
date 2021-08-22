import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//https://changjoopark.medium.com/flutter%EC%97%90%EC%84%9C-json-%EC%9D%91%EB%8B%B5%EC%9D%84-%EB%8B%A4%EB%A3%A8%EB%8A%94-%EB%B0%A9%EB%B2%95-df17ac6a3a3d 참고
//분야별기부단체 API 호출
List data = [];

class Post {
  final String? 	keyword; //키워드
  final String? adres; //주소
  final String? dmstcTelno; //전화번호
  final String? hmpgByid; //홈페이지 주소
  final String? nanmbyNm; //기부단체이름
  final String? rcritRealm; //분야
  Post({
    this.keyword,
    this.adres,
    this.dmstcTelno,
    this.hmpgByid,
    this.nanmbyNm,
    this.rcritRealm});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      keyword: json['keyword'],
      adres: json['adres'],
      dmstcTelno: json['adstcTelno'],
      hmpgByid: json['hmpgByid'],
      nanmbyNm: json['nanmbyNm'],
      rcritRealm: json['rcritRealm'],
    );
  }
}

Future<Post> fetchPost() async {
  final url = 'http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrAreaGrpList';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    return Post.fromJson(jsonBody);
  } else {
    throw Exception('Failed to load post');
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
        body: new Column(
          children: <Widget> [
          FutureBuilder(
              future: fetchPost(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  //final hmpgByid = snapshot.data.hmpgByid;
                  //final nanmbyNm = snapshot.data.nanmbyNm;
                  final keyword = snapshot.data.keyword;
                  return Column(
                    children: <Widget>[
                      /*Text(
                        hmpgByid,
                      ),
                      Text(
                          nanmbyNm,
                      ),^/
                       */
                      Text(
                        keyword,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
          ),
          ],
        ),
      ),
    );
  }
}
