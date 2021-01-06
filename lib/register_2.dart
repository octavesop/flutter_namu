import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MyApp());

//이것은 두 번째 페이지입니다.
class Register2 extends StatelessWidget {
  final Person person;
  Register2({@required this.person});
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
              await Navigator.pushNamed(context, 'reg_3');
            },
          )
        ],
      ),
      body: RaisedButton(
        child: Text('어느 정도의 활동량을 갖고 있나요?'),
        onPressed: () async {
          final person = Person('홍길동', 20);
          final result = await Navigator.pushNamed(context, 'reg_3');
        },
      ),
    );
  }
}

