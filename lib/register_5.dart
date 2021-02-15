import 'package:flutter/material.dart';
import 'main.dart';

//이것은 다섯 번째 페이지입니다.
class Register5 extends StatelessWidget {
  Register5();
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

