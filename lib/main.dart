import 'package:flutter/material.dart';
import 'package:flutter_namu/register_1.dart';
import 'package:flutter_namu/register_2.dart';
import 'package:flutter_namu/register_3.dart';
import 'package:flutter_namu/register_4.dart';
import 'package:flutter_namu/register_5.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Login(),
      routes: {
        'reg_1': (context) => Register1(),
        'reg_2': (context) => Register2(),
        'reg_3': (context) => Register3(),
        'reg_4': (context) => Register4(),
        'reg_5': (context) => Register5(),
        'login': (context) => Login(),
      },
    );
  }
}


class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

