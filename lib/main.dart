import 'dart:io';

import 'package:flutter/material.dart';
import 'signin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  FlutterStatusbarcolor.setStatusBarColor(Color(0xff2f2e41));
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

makingPhoneCall(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _Login extends State<MyApp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode _emailF, _pwF;

  final url = 'http://65.0.4.48:8000/api/accounts/login/';

  bool _obscureText = true;
  String _password;
  String _email;

  bool isValidEmail() {
    if ((_email == null) || (_email.length == 0)) {
      return true;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
  }

  bool isValidPassword() {
    if ((_password == null) || (_password.length == 0)) {
      return true;
    }
    return (_password?.length > 2);
  }

  void _validate() {
    setState(() {
      _email = emailController.text;
      _password = passwordController.text;
    });
  }

  Future<void> performlogin() async {
    try {
      const Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var _res = await http.post(
        Uri.parse('http://65.0.4.48:8000/api/accounts/login/'),
        headers: header,
        body: json.encode({
          'login': _email,
          'password': _password,
        }),
      );
      print(json.decode(_res.body).toString());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoggedinView(),
        ),
      );
    } catch (e) {
      print(e.toString());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoggedinView(),
        ),
      );
    }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _emailF = FocusNode();
    _pwF = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            color: Color(0xff2f2e41),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 5.5 / 8,
              width: MediaQuery.of(context).size.width * 9 / 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xff2f2e41),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xff2f2e41),
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: TextField(
                          focusNode: _emailF,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              focusColor: Color(0xff2f2e41),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              errorText: isValidEmail()
                                  ? null
                                  : "Invalid Email Adress"),
                          onSubmitted: (input) {
                            _emailF.unfocus();
                            _email = input;
                            FocusScope.of(context).requestFocus(_pwF);
                          },
                          onTap: _validate,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xff2f2e41),
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 30,
                        child: TextField(
                          obscureText: _obscureText,
                          focusNode: _pwF,
                          controller: passwordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.deepPurpleAccent),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.deepPurpleAccent),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            errorText: isValidPassword()
                                ? null
                                : "Password Too Short.",
                          ),
                          onSubmitted: (input) {
                            _pwF.unfocus();
                            _password = input;
                          },
                          onTap: _validate,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          performlogin();
                        },
                        child: Container(
                            height: 70,
                            width: 200,
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: FlatButton(
                              color: Color(0xff2f2e41),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _validate();
                                performlogin();
                              },
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                //Password recovery screen
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color(0xff2f2e41),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 8,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Facing Trouble?',
                          style: TextStyle(
                            color: Color(0xff2f2e41),
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 30),
                        child: Row(
                          children: [
                            Text(
                              'Call-us at ',
                              style: TextStyle(
                                color: Color(0xff2f2e41),
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              child: Text(
                                '+91-6377524778 ',
                                style: TextStyle(
                                  color: Color(0xff2f2e41),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () => makingPhoneCall('tel:6377524778'),
                            ),
                            Text(
                              ', ',
                              style: TextStyle(
                                color: Color(0xff2f2e41),
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              child: Text(
                                '+91-8077620595',
                                style: TextStyle(
                                  color: Color(0xff2f2e41),
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () => makingPhoneCall('tel:8077620595'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            color: Colors.transparent.withOpacity(0),
            alignment: Alignment.topCenter,
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
            child: Row(
              children: [
                Text(
                  'Menuhub',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                TextButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return PassGenRequester();
                      }));
                    }),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
            child: Text(
              '© Menuhub.in',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ]));
  }
}
