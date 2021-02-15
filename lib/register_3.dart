import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart' show MyApp, Person;

//이것은 세 번째 페이지입니다.
class Register3 extends StatelessWidget {
  Register3();

  String _value = '';

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
              await Navigator.pushNamed(context, 'reg_4');
            },
          )
        ],
      ),
      body: Column(
        children: [



          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Column(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ListTile (
                      title: Text('Q3. 생년월일은 언제입니까?'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '020101'
                      ),
                    ),
                  ),

                ]),

          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ListTile (
                      title: Text('Q4. 성별은 무엇입니까?'),
                    ),
                  ),
                  Center (
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Padding (
                            padding: const EdgeInsets.only(right: 20),
                            child: RaisedButton (
                              child: Text('남성'),
                              color: Colors.white54,
                              splashColor: Colors.green,
                              onPressed: () {
                                Navigator.pushNamed(context, 'reg_4');
                              },
                            )
                        ),

                        Padding (
                            padding: const EdgeInsets.only(right: 20),
                            child: RaisedButton (
                              child: Text('여성'),
                              color: Colors.white54,
                              onPressed: () {
                                Navigator.pushNamed(context, 'reg_4');

                              },
                            )
                        ),

                        Padding (
                            padding: const EdgeInsets.only(right: 20),
                            child: RaisedButton (
                              child: Text('답하지 않음.'),
                              color: Colors.white54,
                              onPressed: () {
                                Navigator.pushNamed(context, 'reg_4');

                              },
                            )
                        ),
                      ],
                    ),
                  ),
                ]),
          ),

        ],
      ),
    );
  }
}

