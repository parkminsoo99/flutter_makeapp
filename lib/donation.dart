import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';
//분야별기부단체 API 호출
Future<Post> fetchPost() async {
  final response = await http.get(
      'http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrCategoryGrpList?serviceKey=18s%2BB50tjzpz3fb6K9W3KAo9asQ7eXtSX16oFMBs%2BzBpUxJRUVX6Sx5QxiSQ8CXQMowMIHe%2BK5MAekcMLcVuzw%3D%3D&');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load pose');
  }
}

class Post {
  final String adres; //주소
  final String dmstcTelno; //전화번호
  final String hmpgByid; //홈페이지 주소
  final String nanmbyNm; //기부단체이름
  final String rcritRealm; //분야
  post({
    this.adres,
    this.adstcTelno,
    this.hmpgByid,
    this.nanmbyNm,
    this.rcritRealm
  });

  factory Post.fromJson(Map<string, dynamic> json) {
    return Post(
      adrs: json['adres'],
      adstcTelno: json['adstcTelno'],
      hmpgByid: json['hmpgByid'],
      nanmbyNm: json['nanmbyNm'],
      rcritRealm: json['rcritRealm'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key ? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }
  Widget build(BuildContext context) {


    return

  }
}