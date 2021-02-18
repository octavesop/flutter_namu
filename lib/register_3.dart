import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart' show MyApp;



//이것은 세 번째 페이지입니다.
int sex; //성별값을 숫자로 받음
int birthday;
final TextEditingController birth = TextEditingController(); //얘는 생일을 받음
class Register3 extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

//망할놈의 컨트롤러 제어를 하려면 ModalRoute.of(context).settings.arguments가 있어야한단다.
//얘 때문에 삽질을 몇 시간을 한 거냐 나
class ScreenArguments {
  final String contact;
  final String name;

  ScreenArguments({this.contact, this.name});
}

class MyCustomFormState extends State<Register3> {
  MyCustomFormState();


String birthd;
  void _printTextEdit() {
    print(birth.text);
  }

  void initState() {
    super.initState();
    birth.addListener(_printTextEdit);
    //이 친구가
  }

  void dispose() {
    birth.dispose();
    super.dispose();
  }

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
              if (sex > 1 || sex < -1) {
                return AlertDialog(
                  content: Text('값을 선택해주세요.'),
                );
              }
              else {
                await Navigator.pushNamed(context, 'reg_4');
              }
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: '020101'
                      ),
                      controller: birth,
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
                                sex = 1;
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
                                sex = 0;
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
                                sex = -1;
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
