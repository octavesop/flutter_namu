import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MyApp());

//이것은 네 번째 페이지입니다.
class Register4 extends StatelessWidget {
  final Person person;
  Register4({@required this.person});
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
              final person = Person('홍길동', 20);
              final result = await Navigator.pushNamed(context, 'reg_5');
            },
          )
        ],
      ),
      body: RaisedButton(
        child: Text('키와 체중을 알려주세요!'),
        onPressed: () async {
          final person = Person('홍길동', 20);
          final result = await Navigator.pushNamed(context, 'reg_5');
        },
      ),
    );
  }
}

