import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:convert';

//이것은 다섯 번째 페이지입니다.
class Register6 extends StatelessWidget {
  Register6();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('회원가입'),
          actions: <Widget>[
            IconButton(
              icon:Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
            )
          ],
        ),
        body: Column(
          children: <Widget> [
            Text('가입을 환영합니다!'),
            Text('aaaa'),
            Text('1111'),
            Text('163cm'),
            Text('163kg'),
            Text('22세'),
            Text('여성'),
            Text('활동량 많음'),
            Text('체중 감량'),
          ],
        )
    );
  }
}

