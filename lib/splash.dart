import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_namu/login.dart';

HttpGetDemoState pageState;
final String url = "http://13.209.17.162/app_test01/login.php";

String _loginId;
String _loginPw;

//로그인 페이지
class SplashPage extends StatefulWidget {
  @override
  HttpGetDemoState createState() {
    pageState = HttpGetDemoState();
    return pageState;
  }
}

class HttpGetDemoState extends State<SplashPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode myFocusNode = FocusNode();
  String response = "";

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
                '세션 유지가 될까요~안될까요~', //이 안에는 로고가 들어갈 예정입니다.
                style: TextStyle(
                  height: 0,
                  fontSize: 20,
                  color: Colors.white,
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
                  },
                ),
              ),
            ),
          ],
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
        'user_id': '${_loginId = sessionIdReturn()}',
        'user_pass': '${_loginPw = sessionPwReturn()}',
      },
    );
    setState(() {
      response = temp.body;
      print(_loginId);
      print(_loginPw);
      print(response);
      if(response == '{"response":{"header":{"ret_code":"00","ret_msg":"Login"}}}') {
        Navigator.pushNamed(context, 'login_success');
      } else {
        Navigator.pushNamed(context, 'login');
      }
    });
  }
}

