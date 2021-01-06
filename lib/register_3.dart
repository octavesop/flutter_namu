import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MyApp());

//이것은 세 번째 페이지입니다.
class Register3 extends StatelessWidget {
  final Person person;
  Register3({@required this.person});
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
              await Navigator.pushNamed(context, 'reg_4');
            },
          )
        ],
      ),
      body: RaisedButton(
        child: Text('성별과 생일을 알려주세요!'),
        onPressed: () async {
          final person = Person('홍길동', 20);
          final result = await Navigator.pushNamed(context, 'reg_4');
        },
      ),
    );
  }
}

