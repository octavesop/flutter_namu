import 'package:flutter/material.dart';

import 'main.dart' show MyApp;
import 'package:flutter_namu/register_2.dart';

//이것은 첫 번째 페이지입니다.
class AfterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('로그인 성공'),
        ],
      ),
    );
  }
}