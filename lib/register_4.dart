import 'package:flutter/material.dart';
import 'main.dart';

//이것은 네 번째 페이지입니다.
class Register4 extends StatelessWidget {
  Register4();
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
              await Navigator.pushNamed(context, 'reg_5');
            },
            /*
            onPressed: () async {
              final person = Person('홍길동', 20);
              final result = await Navigator.pushNamed(context, 'reg_5');
            },
            */
          )
        ],
      ),
        body: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
              children: <Widget> [

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListTile (
                            title: Text('Q5. 키는 어느 정도입니까?'),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                            ),
                          ),
                        ),

                      ]),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListTile (
                            title: Text('Q6. 체중은 어느 정도입니까?'),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                            ),
                          ),
                        ),

                      ]),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListTile (
                            title: Text('Q7. 목표 체중은 얼마입니까?'),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                            ),
                          ),
                        ),

                      ]),
                ),

              ]),
        ),
    );
  }
}

