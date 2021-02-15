import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

//이것은 네 번째 페이지입니다.
// ignore: must_be_immutable
Map<DateTime, List> _events;
Map<String, dynamic> _test;
List _test2;
List _test3;
class LetsTest extends StatelessWidget {

  Future getData() async {
    _events = {};

    final response =
    await http.get("http://13.209.17.162/app_test01/diaryjson.php");
    String jsondata = response.body;
    Map<String, dynamic> _eventitems = jsonDecode(jsondata);
    _test2 = _eventitems['response']['body']['food'];
    print("dateTime");

    for (var i = 0; i < _test2.length; i++) {
      _test3 =
          jsonDecode(_eventitems['response']['body']['food'][i]['food_json']);

      // 선언만 하면 주소값만 배정.  뒤에 []  선언해야 배열크기 까지 잡아줘서  exception null 이 안뜬다.
      List test4 = [];
      for (var j = 0; j < _test3.length; j++) {
        test4.insert(j, '${_test3[j]['name']}\n${_test3[j]['cal']}kcal');
        //test4 = ['${_test3[j]['name']},${_test3[j]['cal']}'];
      }

      _events[DateTime.parse(_test2[i]['food_date'])] = test4;

      for (int i=0; i<100; i++) {
        print(_test3);
      }
    }
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
            },
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
