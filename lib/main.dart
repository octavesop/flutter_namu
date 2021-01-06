import 'package:flutter/material.dart';
import 'package:flutter_namu/register_1.dart';
import 'package:flutter_namu/register_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Register1(),
      routes: {
        'reg_1': (context) => Register1(),
        'reg_2': (context) => Register2(),
      },
    );
  }
}


class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

