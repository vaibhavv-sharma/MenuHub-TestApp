import 'package:flutter/material.dart';
import 'package:menuhub/main.dart';

import 'setpassword.dart';

class PassGenRequester extends StatefulWidget {
  @override
  SignIn createState() => SignIn();
}

class SignIn extends State<PassGenRequester> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode _nameF, _emailF, _phnF;

  String _name;
  String _email;
  String _phn;

  bool isValidEmail() {
    if ((_email == null) || (_email.length == 0)) {
      return true;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
  }

  bool isValidPhnno() {
    if ((_phn == null) || (_phn.length != 13)) {
      return true;
    }
    return (_phn?.length == 13);
  }

  void _validate() {
    setState(() {
      _name = nameController.text;
      _email = emailController.text;
      _phn = phoneController.text;
    });
  }

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    _nameF = FocusNode();
    _emailF = FocusNode();
    _phnF = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Color(0xff2f2e41),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Name',
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
                        focusNode: _nameF,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusColor: Color(0xff2f2e41),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onSubmitted: (input) {
                          _nameF.unfocus();
                          _name = input;
                          FocusScope.of(context).requestFocus(_emailF);
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
                            errorText:
                                isValidEmail() ? null : "Invalid Email Adress"),
                        onSubmitted: (input) {
                          _emailF.unfocus();
                          _email = input;
                          FocusScope.of(context).requestFocus(_phnF);
                        },
                        onTap: _validate,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        'Phone No.',
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
                        focusNode: _phnF,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusColor: Color(0xff2f2e41),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorText: isValidPhnno()
                                ? null
                                : 'Enter a valid Phone number'),
                        onSubmitted: (input) {
                          _phnF.unfocus();
                          _phn = input;
                        },
                        onTap: _validate,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 200,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff2f2e41),
                        child: Text('Set Password'),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return PassGeneration(_name, _email, _phn);
                          }));
                        },
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
                ),
              ),
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
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
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
        ],
      ),
    );
  }
}
