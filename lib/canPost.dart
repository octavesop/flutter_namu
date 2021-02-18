import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchPhotos(http.Client client) async {
  final response = await http.post(
    'http://13.209.17.162/app_test01/register_user.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: <String, String>{
      'user_id': '11',
      'user_name': 'name',
      'user_pass': 'pass',
      'user_age': '15',
      'user_ht': '160cm',
      'user_wt': '50kg',
      'user_img': '',
      'user_sex':'F',
    },
  );
}

// 응답 결과를 List<Photo>로 변환하는 함수.
List<User> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

int a=0;


class User {
  final String id;
  final String name;
  final String pass;
  final String age;
  final String ht;
  final String wt;
  final String img;
  final String sex;

  User({this.id, this.name, this.pass, this.age, this.ht, this.wt, this.img, this.sex, String body, String ret_code});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      ret_code: json['ret_code'] as String,
      body: json['body'] as String,
    );
  }
}

class CanPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<User>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<User> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].id);
      },
    );
  }
}