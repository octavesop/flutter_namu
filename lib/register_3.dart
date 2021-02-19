import 'package:flutter/material.dart';

//이것은 세 번째 페이지입니다.
int sex; //성별값을 숫자로 받음
int birthday;
final TextEditingController birth = TextEditingController(); //얘는 생일을 받음
class Register3 extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

String _birthday;

class MyCustomFormState extends State<Register3> {
  MyCustomFormState();

  void _printTextEdit() {
    print(birth.text);
    _birthday = birth.text;
    print(_birthday);
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

String returnBirthday() {
  return _birthday;
}

String returnSex() {
  String sexCase;
  switch(sex){
    case 1:
      sexCase = 'M';
      break;

    case 0:
      sexCase = 'F';
      break;

    case -1:
      sexCase = 'N';
      break;
  }
  return sexCase;
}