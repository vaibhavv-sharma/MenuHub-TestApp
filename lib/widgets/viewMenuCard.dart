import 'package:flutter/material.dart';
import 'package:menuhub/classes/menus.dart';
import 'package:dotted_border/dotted_border.dart';

Menu tmp1 = Menu('Pizza Hut', 'Kanpur', true);
String t1 = tmp1.name + ', ' + tmp1.adress;
Menu tmp2 = Menu('Hut Pizza', 'Delhi', true);
String t2 = tmp2.name + ', ' + tmp2.adress;
Menu tmp3 = Menu('Pihut zza', 'Srinagar', false);
String t3 = tmp3.name + ', ' + tmp3.adress;

class ViewMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menus',
            style: TextStyle(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        color: Colors.transparent,
                        height: 53,
                        child: Stack(
                          alignment: Alignment(1.0, 2),
                          children: [
                            Container(
                              color: Color(0xff2f2e41),
                              height: 49,
                              child: Center(
                                child: Text(
                                  'Pizza Hut, Kanpur',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Color(0xff359114),
                              ),
                              alignment: Alignment(1.04, -1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        color: Colors.transparent,
                        height: 53,
                        child: Stack(
                          alignment: Alignment(1.0, 2),
                          children: [
                            Container(
                              color: Color(0xff2f2e41),
                              height: 49,
                              child: Center(
                                child: Text(
                                  'Hut Pizza, Delhi',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Color(0xff359114),
                              ),
                              alignment: Alignment(1.04, -1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        color: Colors.transparent,
                        height: 53,
                        child: Stack(
                          alignment: Alignment(1.0, 2),
                          children: [
                            Opacity(
                              opacity: 0.5,
                              child: Container(
                                color: Color(0xff2f2e41),
                                height: 49,
                                child: Center(
                                  child: Text(
                                    'Pihut Zaa, Srinagar',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Color(0xffff2f2f),
                              ),
                              alignment: Alignment(1.04, -1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        child: DottedBorder(
                          color: Color(0xff2f2e41),
                          strokeWidth: 1,
                          child: Center(
                            child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xff2f2e41),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
