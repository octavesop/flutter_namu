import 'package:flutter/material.dart';
import 'package:flutter_namu/register_1.dart';
import 'package:flutter_namu/register_2.dart';
import 'package:flutter_namu/register_3.dart';
import 'package:flutter_namu/register_4.dart';
import 'package:flutter_namu/register_5.dart';
import 'package:flutter_namu/register_6.dart';
import 'package:flutter_namu/afterLogin.dart';
import 'package:flutter_namu/testFood.dart';
import 'package:flutter_namu/canPost.dart';
import 'package:flutter_namu/testStudy.dart';
import 'package:flutter_namu/login.dart';
//사용하는 모든 페이지를 import 해주세요!

void main() => runApp(MyApp()); //다른 페이지에는 있으면 안 됩니다!

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter', //임의로 바꾸시면 됩니다!
      theme: ThemeData(
          primarySwatch: Colors.green //이건 임의로 바꾸시면 돼요!
      ),
      home: CanPost(),
      routes: {
        'login': (context) => LoginPage(), //이렇게 하면 다른 페이지에서는 LoginPage 클래스를 login으로 호출할 수 있게 됩니다!
        'reg_1': (context) => Register1(),
        'reg_2': (context) => Register2(),
        'reg_3': (context) => Register3(),
        'reg_4': (context) => Register4(),
        'reg_5': (context) => Register5(),
        'reg_6': (context) => Register6(),
        'can_post': (context) => CanPost(),
        'after_login': (context) => AfterLogin(),
        'TestTest': (context) => HttpDemo(),
      },
    );
  }
}