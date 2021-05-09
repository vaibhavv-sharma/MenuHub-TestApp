import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:menuhub/main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;

import 'home2.dart';

class PassGeneration extends StatefulWidget {
  final String name, email, phn;
  PassGeneration(this.name, this.email, this.phn);

  @override
  PassKey createState() => PassKey(name, email, phn);
}

class PassKey extends State<PassGeneration> {
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  FocusNode _passF, _cpassF;
  final String _name, _email, _phn;
  String _pass;
  String _cpass;

  PassKey(this._name, this._email, this._phn);

  bool isValidPassword() {
    if ((_pass == null) || (_pass.length == 0)) {
      return true;
    }
    return (_pass?.length > 2);
  }

  bool isValidCPassword() {
    if ((_cpass == null) || (_cpass.length == 0)) {
      return true;
    }
    return (_cpass?.length > 2);
  }

  void _validate() {
    setState(() {
      _pass = passController.text;
      _cpass = cpassController.text;
    });
  }

  Future<void> performaction() async {
    try {
      const Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var _res = await http.post(
        Uri.parse('http://65.0.4.48:8000/api/accounts/register/'),
        headers: header,
        body: json.encode({
          'name': _name,
          'email': _email,
          'phone': _phn,
          'password': _pass,
          'confirm_password': _cpass,
        }),
      );
      print(json.decode(_res.body).toString());
      print(_res.statusCode);
      if (_res.statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignedinView(),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    passController = TextEditingController();
    cpassController = TextEditingController();
    _passF = FocusNode();
    _cpassF = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set Your Password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff2f2e41),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xff2f2e41),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 2.5 / 8,
              width: MediaQuery.of(context).size.width * 9 / 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '||',
                        style: TextStyle(
                            color: Color(0xff2f2e41),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
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
                        obscureText: true,
                        focusNode: _passF,
                        controller: passController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          errorText:
                              isValidPassword() ? null : "Password Too Short.",
                        ),
                        onSubmitted: (input) {
                          _passF.unfocus();
                          _pass = input;
                          FocusScope.of(context).requestFocus(_cpassF);
                        },
                        onTap: _validate,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 20,
                      ),
                      child: Text(
                        'Confirm-Password',
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
                        obscureText: true,
                        focusNode: _cpassF,
                        controller: cpassController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
                          errorText:
                              isValidCPassword() ? null : "Password Too Short.",
                        ),
                        onSubmitted: (input) {
                          _cpassF.unfocus();
                          _cpass = input;
                        },
                        onTap: _validate,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        performaction();
                      },
                      child: Container(
                          height: 70,
                          width: 200,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xff2f2e41),
                            child: Text('Set Password'),
                            onPressed: () {
                              _validate();
                              performaction();
                            },
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 8,
                    ),
                  ],
                ),
              ),
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
        ],
      ),
    );
  }
}
