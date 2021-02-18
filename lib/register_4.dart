import 'package:flutter/material.dart';
import 'main.dart';

//이것은 네 번째 페이지입니다.

class Register4 extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<Register4> {
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController aimWeight = TextEditingController();
  MyCustomFormState();

  void _printHeightTextEdit() {
    print('키 값은: ${height.text}');
  }

  void _printWeightTextEdit() {
    print('몸무게 값은: ${weight.text}');
  }

  void _printAimWeightTextEdit() {
    print('목표 체중 값은: ${aimWeight.text}');
  }

  void initState() {
    super.initState();
    height.addListener(_printHeightTextEdit);
    weight.addListener(_printWeightTextEdit);
    aimWeight.addListener(_printAimWeightTextEdit);
    //이 친구가
  }

  void dispose() {
    height.dispose();
    weight.dispose();
    aimWeight.dispose();
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
              await Navigator.pushNamed(context, 'reg_5');
              print(height);
              print(weight);
              print(aimWeight);
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
                            controller: height,
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
                            controller: weight,
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
                            controller: aimWeight,
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

