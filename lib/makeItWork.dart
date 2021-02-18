import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<User> createAlbum(String title) async {
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

  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class User {
  final String id;
  final String name;
  final String pass;
  final String age;
  final String ht;
  final String wt;
  final String img;
  final String sex;

  User({this.id, this.name, this.pass, this.age, this.ht, this.wt, this.img, this.sex});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user_id'],
      name: json['user_name'],
      pass: json['user_pass'],
      age: json['user_age'],
      ht: json['user_ht'],
      wt: json['user_wt'],
      img: json['user_img'],
      sex: json['user_sex']
    );
  }
}

class MakeItWork extends StatefulWidget {
  MakeItWork({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MakeItWork> {
  final TextEditingController _controller = TextEditingController();
  Future<User> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
              ElevatedButton(
                child: Text('Create Data'),
                onPressed: () {
                  setState(() {
                    _futureAlbum = createAlbum(_controller.text);
                  });
                },
              ),
            ],
          )
              : FutureBuilder<User>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.id);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
