import 'package:flutter/material.dart';
import 'main.dart' show MyApp, Person;

//이것은 두 번째 페이지입니다.
class Register2 extends StatelessWidget {
  Register2();
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
              await Navigator.pushNamed(context, 'reg_3');
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
                        title: Text('Q2. 어느 정도의 활동량을 가지고 계십니까?'),
                      ),
                    ),

                    Padding (
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox.fromSize(
                        size: Size(370, 80), // button width and height
                          child: Material(
                            color: Colors.white24, // button color
                              child: InkWell(
                              splashColor: Colors.green, // splash color
                              onTap: () {
                                Navigator.pushNamed(context, 'reg_3');
                              }, // button pressed
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                  Icon(Icons.person, size: 80,), // icon
                                  Text("매우 활동적이며 주 3회 이상 체육관에 갑니다!\n꾸준히 하고 있는 운동이 있으며\n직업 특성상 신체 활동이 많이 요구됩니다!\n"
                                  ), // text
                                  ],
                                  ),
                                ),
                            ),
                          ),
                        ),

                    Padding (
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox.fromSize(
                        size: Size(370, 80), // button width and height
                        child: Material(
                          color: Colors.white24, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            onTap: () {
                              Navigator.pushNamed(context, 'reg_3');
                            }, // button pressed
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.person, size: 80,), // icon
                                Text("야외 활동을 좋아하며 산책, 자전거 같이\n가벼운 운동을 주기적으로 합니다.\n직업 특성상 활동이 조금 필요합니다."
                                ), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding (
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox.fromSize(
                        size: Size(370, 80), // button width and height
                        child: Material(
                          color: Colors.white24, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            onTap: () {
                              Navigator.pushNamed(context, 'reg_3');
                            }, // button pressed
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.person, size: 80,), // icon
                                Text("운동을 주기적으로 하지는 않지만\n종종 걷기나 가벼운 운동을 합니다.\n신체 활동은 직무에서 거의 필요하지 않습니다."
                                ), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding (
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox.fromSize(
                        size: Size(370, 80), // button width and height
                        child: Material(
                          color: Colors.white10, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            onTap: () {
                              Navigator.pushNamed(context, 'reg_3');
                            }, // button pressed
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.person, size: 80,), // icon
                                Text("하루의 대부분을 앉아서 보냅니다.\n에너지도 시간도 없습니다.\n좀비가 오지 않는 한 뛰지 않습니다.\n"
                                ), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
      }
}

