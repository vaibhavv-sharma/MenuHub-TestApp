import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menuhub/widgets/leftDrawer.dart';
import 'package:menuhub/widgets/rightDrawerTwo.dart';
import 'package:menuhub/widgets/verificationWid.dart';

class Categories extends StatefulWidget {
  @override
  Catego createState() => Catego();
}

class Catego extends State<Categories> {
  final _optionx = "assets/options.svg";
  final _optiony = 'assets/threedots.svg';
  final cross = 'assets/cross2.svg';
  bool isSwitched = true;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 100,
        child: OpenLeftDrawer(),
      ),
      endDrawer: Drawer(
        elevation: 100,
        child: OpenRightDrawer2(),
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: Builder(
        builder: (context) => Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: 45,
                  color: Color(0xff2f2e41),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 18, 8),
                    child: Row(
                      children: [
                        FlatButton(
                            minWidth: 0,
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: SvgPicture.asset(_optionx)),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Menuhub',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(_optiony),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                  child: VerificationWidget(
                    onpress: () => {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: <Widget>[
                              Container(
                                height: 220,
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 44,
                                        width: 300,
                                        color: Color(0xff2f2e41),
                                        child: Center(
                                          child: Text(
                                            'Menuhub',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 86,
                                        width: 89,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Subscribe for',
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xff2f2e41,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                5,
                                              ),
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                color: Colors.red,
                                                child: Row(),
                                              ),
                                            ),
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  'year @ 2300/yr',
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xff2f2e41,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 44,
                                        width: 300,
                                        color: Color(0xff19ca55),
                                        child: Center(
                                          child: Text(
                                            'Activate Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                width: 300,
                              )
                            ],
                          );
                        },
                      ),
                    },
                    fst: 'Menu Not Activated',
                    snd: 'Activate now',
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'Change Preference',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff2f2e41),
                          ),
                        ),
                      ),
                      Text(
                        'Sort By',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2f2e41),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xff2f2e41),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 15, 0),
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff2f2e41),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    width: MediaQuery.of(context).size.width - 25,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Container(
                              height: 30,
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Flexible(
                                flex: 2,
                                child: Text(
                                  'Pref',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Flexible(
                                flex: 6,
                                child: Text(
                                  'Category name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Flexible(
                                flex: 2,
                                child: Text(
                                  'Icon',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Flexible(
                                flex: 2,
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Text(' '),
                          ],
                          decoration: BoxDecoration(
                            color: Color(0xff2f2e41),
                          ),
                        ),
                        TableRow(
                          children: [
                            Container(
                              height: 50,
                              padding: EdgeInsets.fromLTRB(16, 15, 0, 0),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xff2f2e41),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              padding: EdgeInsets.fromLTRB(12, 15, 0, 0),
                              child: Text(
                                'Pizza',
                                style: TextStyle(
                                  color: Color(
                                    0xff2f2e41,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.local_pizza,
                              color: Color(0xff2f2e41),
                            ),
                            Container(
                              width: 30,
                              child: Switch(
                                  value: isSwitched,
                                  onChanged: (bool s) {
                                    setState(() {
                                      isSwitched = s;
                                    });
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 15, 0, 0),
                              child: SvgPicture.asset(
                                'assets/edit.svg',
                              ),
                            )
                          ],
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 10,
                color: Color(0xff2f2e41),
              ),
            ),
            Positioned(
              bottom: 50,
              right: -25,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(
                  0xff2f2e41,
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: -13,
              child: TextButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: SvgPicture.asset(
                  cross,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              right: 5,
              child: SvgPicture.asset(
                'assets/temp.svg',
              ),
            ),
            Positioned(
              bottom: 10,
              right: 5,
              child: SvgPicture.asset(
                'assets/temp2.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
