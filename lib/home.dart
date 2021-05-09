import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuhub/widgets/basicAnalytics.dart';
import 'package:menuhub/widgets/leftDrawer.dart';
import 'package:menuhub/widgets/verificationWid.dart';
import 'package:menuhub/widgets/viewMenuCard.dart';

class LoggedinView extends StatefulWidget {
  @override
  State createState() => HomeScreen();
}

class HomeScreen extends State<LoggedinView> {
  final optionx = "assets/options.svg";
  final optiony = 'assets/threedots.svg';

  TextEditingController otpC = TextEditingController();
  TextEditingController capC = TextEditingController();

  String otp, captcha;

  void validate() {
    setState(() {
      otp = otpC.text;
      captcha = capC.text;
    });
  }

  @override
  void initState() {
    otpC = TextEditingController();
    capC = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 100,
        child: OpenLeftDrawer(),
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: Builder(
        builder: (context) => ListView(
          children: [
            Container(
              height: 45,
              color: Color(0xff2f2e41),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Row(
                  children: [
                    FlatButton(
                        minWidth: 0,
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: SvgPicture.asset(optionx)),
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
                    SvgPicture.asset(optiony),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            VerificationWidget(
              onpress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: <Widget>[
                          Container(
                            color: Colors.white,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/pm.svg',
                                        height: 50,
                                        width: 50,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 40, 0, 20),
                                        child: Text(
                                          'Verify',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 20, 5),
                                      child: Text('Enter Otp'),
                                    ),
                                    alignment: Alignment.topLeft,
                                  ),
                                  Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                    ),
                                    child: TextField(
                                      controller: otpC,
                                      cursorColor: Color(0xff2f2e41),
                                      decoration: InputDecoration(
                                        focusColor: Color(0xff2f2e41),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      keyboardType: TextInputType.number,
                                      onSubmitted: (input) {
                                        otp = input;
                                      },
                                      onTap: validate,
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 20, 5),
                                      child: Text('Captcha'),
                                    ),
                                    alignment: Alignment.topLeft,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 125,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                        ),
                                        child: TextField(
                                          controller: capC,
                                          cursorColor: Color(0xff2f2e41),
                                          decoration: InputDecoration(
                                            focusColor: Color(0xff2f2e41),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onSubmitted: (input) {
                                            captcha = input;
                                          },
                                          onTap: validate,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 100,
                                        height: 50,
                                        color: Color(0xffc4c4c4),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 05),
                                    child: Container(
                                      color: Color(0xff2f2e41),
                                      width: 250,
                                      height: 50,
                                      child: TextButton(
                                          onPressed: null,
                                          child: Text(
                                            'Verify',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '4.30',
                                        style: TextStyle(
                                          color: Color(0xff2f2e41),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Resend otp',
                                        style: TextStyle(
                                          color: Color(0xff2f2e41),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              fst: 'Email not verified',
              snd: 'Verify now',
            ),
            VerificationWidget(
              onpress: null,
              fst: 'Phone not verified',
              snd: 'Verify now',
            ),
            BasicAnalysisViewer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                color: Color(0xffD3D3D3),
              ),
            ),
            ViewMenus(),
            Center(
              child: Text('Hello '),
            ),
          ],
        ),
      ),
    );
  }
}
