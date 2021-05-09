import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuhub/home.dart';
import 'package:menuhub/mmenus.dart';

class OpenLeftDrawer extends StatelessWidget {
  final cros = 'assets/leftdrawer/Cross.svg';
  final home = 'assets/leftdrawer/homee.svg';
  final menu = 'assets/leftdrawer/menuicon.svg';
  final qr = 'assets/leftdrawer/qrcode.svg';
  final trans = 'assets/leftdrawer/refresh1.svg';
  final anal = 'assets/leftdrawer/piechart.svg';
  final sup = 'assets/leftdrawer/telemarket.svg';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2f2e41),
      width: 200,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 15, 20),
              child: Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(cros),
              ),
            ),
          ),
          TextButton(
            onPressed: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoggedinView(),
                ),
              ),
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      home,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Menus(),
                ),
              ),
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      menu,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Menus',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: null,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      qr,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Buy QR\'s',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: null,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      trans,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: null,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      anal,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Analytics',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: null,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      sup,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Support',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Text(
                '© Mehuhub.in',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
