import 'package:flutter/material.dart';
import 'main.dart';

//이것은 다섯 번째 페이지입니다.
class Register5 extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

String _id;
String _email;
String _pw;
String _pwCheck;

class MyCustomFormState extends State<Register5> {
  final TextEditingController id = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pw = TextEditingController();
  final TextEditingController pwCheck = TextEditingController();
  MyCustomFormState();

  void _printIdTextEdit() {
    print('아이디 값은: ${id.text}');
    _id = id.text;
  }

  void _printEmailTextEdit() {
    print('이메일 값은: ${email.text}');
    _email = email.text;
  }

  void _printPwTextEdit() {
    print('비밀번호 값은: ${pw.text}');
    _pw = pw.text;
  }

  void _printPwCheckTextEdit() {
    print('비밀번호 체크 값은: ${pw.text}');
    _pwCheck = pwCheck.text;
  }

  void initState() {
    super.initState();
    id.addListener(_printIdTextEdit);
    email.addListener(_printEmailTextEdit);
    pw.addListener(_printPwTextEdit);
    pwCheck.addListener(_printPwCheckTextEdit);
    //이 친구가
  }

  void dispose() {
    id.dispose();
    email.dispose();
    pw.dispose();
    pwCheck.dispose();
    super.dispose();
  }

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
              Navigator.pushNamed(context, 'reg_6');
            },
          )
        ],
      ),
        body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      controller: id,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        fillColor: Colors.white,
                        labelText: '아이디',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        fillColor: Colors.white,
                        labelText: '이메일',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      controller: pw,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        fillColor: Colors.white,
                        labelText: '비밀번호',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      controller: pwCheck,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        fillColor: Colors.white,
                        labelText: '비밀번호 확인',
                      ),
                    ),
                    ),
                  ],

        )
        )
    );
  }
}

String returnId() {
  return _id;
}

String returnEmail() {
  return _email;
}

String returnPw() {
  return _pw;
}