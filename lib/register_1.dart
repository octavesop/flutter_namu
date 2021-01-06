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
          title: Text('회원가입'),
          actions: <Widget>[
            IconButton(
              icon:Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.pushNamed(context, 'reg_2');
              },
            )
          ],
      ),
        body: RaisedButton(
        child: Text('목표는 무엇인가요?'),
        onPressed: () async {
          final person = Person('홍길동', 20);
          final result = await Navigator.pushNamed(context, 'reg_2');
        },
      ),
    );
  }



}
