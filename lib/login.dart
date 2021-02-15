import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};
class Post {
  //멤버변수 지정하면 자동 초기화
  final int userId;
  final int id;
  final String title;
  final String body;

  //생성자
  Post({this.userId, this.id, this.title, this.body});

  //factory는 클래스 함수로 생성자를 만들 때 사용하는 키워드. (Post 정보를 포함하는 인스턴스를 생성하여 반환하는 factory 생성자)
  //factory란 개발자가 임의로 클래스의 인스턴스를 생성해서 이용하는 패턴이 아닌, 인스턴스를 대신 생성해서 반환해주는 패턴 기법이다.
  //factory 생성자를 이용해 JSON 객체를 초기화 할 수 있도록 factory Post.fromJson 메소드 추가
  //아규먼트로 넘겨 받은 JSON 데이터를 새로운 Post 클래스의 인스턴스로 생성하여 반환한다.
  //전역 함수처럼 동작하기 때문에 this 키워드를 사용할 수 없다.
  factory Post.fromJson(Map<String, dynamic> json) {
    //여기서 Post는 우편(수신 메시지)이라는 뜻으로 명명한 것이지 Http 프로토콜의 Post 방식을 의미하는 것은 아니다.
    //실제 앱에서는 Post 방식이 아닌 Get 방식으로 데이터를 수신하고 있다.
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
//로그인 페이지
class LoginPage extends StatefulWidget {
  final int id;
  final String pw;
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> login;

  LoginPage({Key key, this.id, this.pw, this.login}) : super(key: key);

  factory LoginPage.fromJson(Map<String, dynamic> userMap) {
    return LoginPage(
      id: userMap['id'],
      pw: userMap['pw'],
    );
  }

  @override
  Login createState() {
    return Login();
  }

  Future<Post> fetchUser() async {
    final url = 'https://jsonplaceholder.typicode.com/posts/1';
    final response = await http.get(url);
    // 웹 서버로부터 정상(200) 데이터 수신
    if (response.statusCode == 200) {
      //수신 메시지의 body부분을 JSON 객체로 디코딩한후 Post.fromJson 메소드를 통해 다시 파싱함
      //json 데이터를 수신해서 Post 객체로 변환
      final jsonBody = json.decode(response.body);
      print(jsonBody);
      return Post.fromJson(jsonBody);
      //200 ok 가 아니라면, 실제 상황에서는 데이터 수신에 실패했을 때의 처리를 제공해야 한다.
      //다시 읽어야 한다던가 빈 데이터 또는 에러를 표시한다던가.
    } else {
      //데이터 수신에 실패했을 경우, throw Exception : 사용자 정의 예외를 던진다.
      throw Exception('Failed to load post');
    }
  }
}

class Login extends State<LoginPage> {
  String _userId, _userPw= "";

  final _formKey = GlobalKey<FormState>();

  FocusNode _id = FocusNode();
  FocusNode _pw = FocusNode();

  @override
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
                    if (_formKey.currentState.validate()) {
                      // 스낵바를 통해 메시지 출력
                      Scaffold.of(context)
                          // ignore: deprecated_member_use
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
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
          validator: (name) {
            if (name.isEmpty) {
              return '아이디를 입력하세요.';
            }
            return null;
          },
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
          textInputAction: TextInputAction.next,
          //여기서부터 validation 검증

          onSaved: (name)=> _userId = name,
        ),
      ),
    );
  }

  Widget pw() {
    return Container(
      child: Center(
        child: TextFormField(
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

          //여기서부터 validation 검증
          validator: (name) {
            if (name.isEmpty) {
              return '비밀번호를 입력하세요.';
            }
            return null;

          },
          onSaved: (name)=> _userPw = name,
        ),
      ),
    );
  }

  }

