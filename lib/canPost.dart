import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('http://13.209.17.162/app_test01/register_user.php');

  // compute 함수를 사용하여 parsePhotos를 별도 isolate에서 수행합니다.
  return compute(parsePhotos, response.body);
}

// 응답 결과를 List<Photo>로 변환하는 함수.
List<User> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}
int a=0;
class User {
  final int userId;
  final int id;
  final String title;
  final String body;

  User({this.userId, this.id, this.title, this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['url'] as String,
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
        if(photos[index].title == 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit') {
          return Text(photos[index].title+"---yes");
        } else {
          return Text(photos[index].title+"---no");
        }
        //return Image.network(photos[index].thumbnailUrl);

      },
    );
  }
}