import 'package:flutter/material.dart';

import 'main.dart';
import 'package:flutter_namu/register_1.dart';

void main() => runApp(MyApp());

//이것은 두 번째 페이지입니다.
class Register2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: RaisedButton(
        child: Text('이전 페이지로 가용'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}