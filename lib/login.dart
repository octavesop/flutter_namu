import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MyApp());

//로그인 페이지입니다.
//상단바를 삭제해야 합니다.
//행복합시다...


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '키',
          ),
        )
      ],
    );
  }
}

class _buildTop {
}

class _buildMiddle {
}

class _buildBottom {
}