import 'package:flutter/material.dart';
import 'package:flutter_namu/register_1.dart';
import 'package:flutter_namu/register_2.dart';
import 'package:flutter_namu/register_3.dart';
import 'package:flutter_namu/register_4.dart';
import 'package:flutter_namu/register_5.dart';
import 'package:http/http.dart' as http;

//이것은 여섯 번째 페이지입니다.

//페이지 1에서 받아옴
String _aimWeightCaseInput = returnAimWeightCase();

//페이지 2에서 받아옴
String _activeCase = returnActive();

//페이지 3에서 받아옴
String _birthday = returnBirthday();
String _sex = returnSex();

//페이지 4에서 받아옴
String _height = returnHeight();
String _weight = returnWeight();
String _aimWeight = returnAimWeight();

//페이지 5에서 받아옴
String _id = returnId();
String _pw = returnPw();
String _email = returnEmail();

final String url = "http://13.209.17.162/app_test01/register_user.php";

class Register6 extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<Register6> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode myFocusNode = FocusNode();
  String response = "";

  TextStyle ts = TextStyle(fontSize: 12);

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
          title: Text('회원가입'),
          actions: <Widget>[
            IconButton(
              icon:Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
                _getUrl(url);
                print('키는');
                print(_height);
              },
            )
          ],
        ),
        body: Column(
          children: <Widget> [
            Text('활동량은 ${_activeCase}입니다.'),
            Text('생일은 ${_birthday}이고, 성별은 ${_sex}입니다.'),
            Text('키는 ${_height}cm이고, 체중은 ${_weight}kg 입니다.'),
            Text('원하는 체중은 ${_aimWeight}kg이며,  ${_aimWeightCaseInput}이 목표입니다.'),
            Text('아이디는 ${_id}이며, 메일은 ${_email}입니다. 비밀번호는 ${_pw}입니다.'),
          ],
        )
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
        'user_id': '${_id}',
        'user_name': 'flutter',
        'user_pass': '${_pw}',
        'user_age': '20',
        'user_ht': '${_height}',
        'user_wt': '${_weight}',
        'user_img': 'flutter.jpg',
        'user_sex':'${_sex}',
      },
    );
    setState(() {
      response = temp.body;
      print(response);
    });
  }
}

