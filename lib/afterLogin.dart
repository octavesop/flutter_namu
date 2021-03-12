import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String url = "http://13.209.17.162/app_test01/test_stat.php";
String printText= "세션연결을 하고 싶다네";

class LoginSuccess extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<LoginSuccess> {
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
          title: Text('로그인에 성공했어요'),
        ),
        body: Column(
          children: <Widget> [
            RaisedButton(
              child: Text('로그인'),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.limeAccent,
              onPressed: () {
                _getUrl(url);
              },
            ),
            Text(response),
          ],
        )
    );
  }

  _getUrl(String url) async {
    setState(() {
      response = null;
    });
    var temp = await http.post(url);

    setState(() {
      response = temp.body;
      print(response);
    });
  }
}

