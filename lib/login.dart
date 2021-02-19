import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

HttpGetDemoState pageState;
final String url = "http://13.209.17.162/app_test01/login.php";

String _loginId;
String _loginPw;

//로그인 페이지
class LoginPage extends StatefulWidget {
  @override
  HttpGetDemoState createState() {
    pageState = HttpGetDemoState();
    return pageState;
  }
}

class HttpGetDemoState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController loginId = TextEditingController();
  final TextEditingController loginPw = TextEditingController();

  FocusNode myFocusNode = FocusNode();
  String response = "";

  void _printIdTextEdit() {
    print('키 값은: ${loginId.text}');
    _loginId = loginId.text;
  }

  void _printPwTextEdit() {
    print('몸무게 값은: ${loginPw.text}');
    _loginPw = loginPw.text;
  }

  void initState() {
    super.initState();
    loginId.addListener(_printIdTextEdit);
    loginPw.addListener(_printPwTextEdit);
  }

  void dispose() {
    loginId.dispose();
    loginPw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                'EZFit', //이 안에는 로고가 들어갈 예정입니다.
                style: TextStyle(
                  height: 0,
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: id(),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: pw(),
            ),

            //따로 안 뺀 이유는 이 친구가 build 안에 있어야 하기 때문입니다.
            Padding(
              padding: const EdgeInsets.all(10),
              child:ButtonTheme(
                minWidth: 400.0,
                height: 60.0,
                child: RaisedButton(
                  child: Text('회원가입'),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.limeAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'reg_1');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ButtonTheme(
                minWidth: 400.0,
                height: 60.0,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text('로그인'),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.limeAccent,
                  onPressed: () {
                    _getUrl(url);
                    print(response);
                    if(response == '{"response":{"header":{"ret_code":"00","ret_msg":"Login"}}}') {
                      Navigator.pushNamed(context, 'login_success');
                    }

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget id() {
    return Container(
      child: Center(
        child: TextFormField(
          controller: loginId,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text ,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: '아이디',
          ),
        ),
      ),
    );
  }

  Widget pw() {
    return Container(
      child: Center(
        child: TextFormField(
          controller: loginPw,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text ,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: '비밀번호',
          ),
        ),
      ),
    );
  }

  _getUrl(String url) async {
    setState(() {
      response = null;
    });
    var temp = await http.post(url,
      headers: {
      },
      body:
      <String, String>{
        'user_id': '${_loginId}',
        'user_pass': '${_loginPw}',
      },
    );
    setState(() {
      response = temp.body;
    });
  }
  }

