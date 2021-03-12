import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
class ICanDoIt {
  

}

/*
JWTDemoState pageState;
final String url = "http://13.209.17.162/app_test01/login.php";

//로그인 페이지
class ICanDoIt extends StatefulWidget {
  @override
  JWTDemoState createState() {
    pageState = JWTDemoState();
    return pageState;
  }
}
*/

printIt(String token) {
  Map<String, dynamic> payload = Jwt.parseJwt(token);

  print(payload);
}
class JWTDemoState extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgRGVjb2RlIiwiaWF0IjoxNjA4NTgxNzczLCJleHAiOjE2NDAxMTc3NzMsImF1ZCI6Ind3dy5qd3RkZWNvZGUuY29tIiwic3ViIjoiQSBzYW1wbGUgSldUIiwibmFtZSI6IlZhcnVuIFMgQXRocmV5YSIsImVtYWlsIjoidmFydW4uc2F0aHJleWFAZ21haWwuY29tIiwicm9sZSI6IkRldmVsb3BlciJ9.vXE9ogUeMMsOTz2XQYHxE2hihVKyyxrhi_qfhJXamPQ';


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
              child: ButtonTheme(
                minWidth: 400.0,
                height: 60.0,
                child: RaisedButton(
                  child: Text(printIt(token)),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.limeAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'reg_1');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}