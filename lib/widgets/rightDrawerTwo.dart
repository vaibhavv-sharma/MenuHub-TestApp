import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String mtitle, location;

TextEditingController mtC, lC;

class OpenRightDrawer2 extends StatelessWidget {
  final cros = 'assets/leftdrawer/Cross.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2f2e41),
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 0, 20),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(cros),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: Text(
                    'Add Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'Category Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  height: 30,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: TextField(
                    controller: mtC,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0)),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0)),
                    ),
                    keyboardType: TextInputType.name,
                    onSubmitted: (input) {
                      mtitle = input;
                    },
                    onTap: () {
                      mtitle = mtC.text;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'Icon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          Text('Hello'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Color(0xff2f2e41),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: Text(
              'or',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              height: 50,
              child: Center(
                child: Text(
                  'Add and Activate instantly @ 2300 INR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
