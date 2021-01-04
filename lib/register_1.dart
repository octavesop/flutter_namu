import 'package:flutter/material.dart';

import 'main.dart';
import 'package:flutter_namu/register_2.dart';

void main() => runApp(MyApp());

//이것은 첫 번째 페이지입니다.
class Register1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('First'),
        ),
        body: RaisedButton(
        child: Text('다음 페이지로 가용'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Register2()),
          );
        },
      ),
    );
  }
}