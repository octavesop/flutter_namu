import 'package:flutter/material.dart';

import 'main.dart' show MyApp;
import 'package:flutter_namu/register_2.dart';

//이것은 첫 번째 페이지입니다.
enum Weight {DOWN, UP, STAY} //라디오 버튼에서 그룹이 되는 항목을 열거형으로 나타낸 것.
Weight _weight = Weight.STAY;

class Register1 extends StatefulWidget {
  @override
  // ignore: missing_return
  State<StatefulWidget> createState() {
    //RadioList createState() => RadioList();
    return RadioList();
  }

}
// ignore: must_be_immutable
class RadioList extends State<Register1> {
  final myController = TextEditingController(); //현재값을 얻는데 필요해.
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
                await Navigator.pushNamed(context, 'reg_2'
                );
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
                          title: Text('Q1. 목표를 선택하세요.'),
                        ),
                      ),
                      Row(
                        children: [
                          Radio (
                              value: "감량",
                              groupValue: _weight,
                              onChanged: (value) {
                                Navigator.pushNamed(context, 'reg_2');
                              }
                          ),
                          Text("체중 감량"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio (
                              value: "유지",
                              groupValue: _weight,
                              onChanged: (value) {
                                Navigator.pushNamed(context, 'reg_2');
                              }
                          ),
                          Text("체중 유지"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio (
                              value: "증량",
                              groupValue: _weight,
                              onChanged: (value) {
                                Navigator.pushNamed(context, 'reg_2');
                              }
                          ),
                          Text("체중 증량"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
        );
  }
}
