import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

HttpGetDemoState pageState;

class HttpDemo extends StatefulWidget {
  @override
  HttpGetDemoState createState() {
    pageState = HttpGetDemoState();
    return pageState;
  }
}

class HttpGetDemoState extends State<HttpDemo> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController teCon =
  TextEditingController(text: "http://13.209.17.162/app_test01/register_user.php");

  FocusNode myFocusNode = FocusNode();
  String response = "";

  TextStyle ts = TextStyle(fontSize: 12);

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
    teCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text("Http Get Request")),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("URL:", style: ts),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        style: TextStyle(fontSize: 10),
                        decoration: InputDecoration(),
                        controller: teCon,
                        focusNode: myFocusNode,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(0),
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      child: Text("GET", style: ts),
                      onPressed: () {
                        _getUrl(teCon.text.toString());
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Center(
                  child: (response == null)
                      ? CircularProgressIndicator()
                      : SingleChildScrollView(
                      child:
                      Text(response, style: TextStyle(fontSize: 13))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  customButton(String text, String url) {
    return Container(
      width: 70,
      child: RaisedButton(
        padding: const EdgeInsets.all(0),
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(text, style: ts),
        onPressed: () {
          teCon.text = url;
        },
      ),
    );
  }


  _getUrl(String url) async {
    setState(() {
      response = null;
    });
    var temp = await http.post("http://13.209.17.162/app_test01/register_user.php",
        headers: {
        },
        body:
          <String, String>{
            'user_id': 'fluttertest',
            'user_name': 'name',
            'user_pass': '1234',
            'user_age': '15',
            'user_ht': '160',
            'user_wt': '50',
            'user_img': 'flutter.jpg',
            'user_sex':'F',
          },
    );
    setState(() {
      response = temp.body;
    });
  }
}
