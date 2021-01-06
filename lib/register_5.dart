import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MyApp());

//이것은 다섯 번째 페이지입니다.
class Register5 extends StatelessWidget {
  final Person person;
  Register5({@required this.person});
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
            onPressed: () {},
          )
        ],
      ),
      body: RaisedButton(
        child: Text('아이디와 비번을 입력해주세요!'),
        onPressed: () async {
          //여기 문제는 pop이 안되면서 이전키가 활성화된다는 것.
          final result = await Navigator.pushNamed(context, 'login');
        },
      ),
    );
  }
}

