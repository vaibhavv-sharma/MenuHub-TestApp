import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasicAnalysisViewer extends StatelessWidget {
  final bg1 = 'assets/menuicon.svg';
  final bg2 = 'assets/icon.svg';
  final bg3 = 'assets/click.svg';
  final bg4 = 'assets/Group.svg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.width - 40) / 2,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Center(
                                child: Text(
                                  'Active Menus',
                                  style: TextStyle(
                                    color: Color(0xff2f2e41),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: SvgPicture.asset(
                                bg1,
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              width:
                                  (MediaQuery.of(context).size.width - 60) / 2,
                              color: Color(0xff2f2e41),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Center(
                                child: Text(
                                  'Active Links',
                                  style: TextStyle(
                                    color: Color(0xff2f2e41),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: SvgPicture.asset(
                                bg2,
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              width:
                                  (MediaQuery.of(context).size.width - 60) / 2,
                              color: Color(0xff2f2e41),
                              child: Center(
                                child: Text(
                                  '23',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: (MediaQuery.of(context).size.width - 40) / 2,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Center(
                                child: Text(
                                  'Total Clicks',
                                  style: TextStyle(
                                    color: Color(0xff2f2e41),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: SvgPicture.asset(
                                bg3,
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              width:
                                  (MediaQuery.of(context).size.width - 60) / 2,
                              color: Color(0xff2f2e41),
                              child: Center(
                                child: Text(
                                  '5732',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Center(
                                child: Text(
                                  'Next Purchase',
                                  style: TextStyle(
                                    color: Color(0xff2f2e41),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: SvgPicture.asset(
                                bg4,
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              width:
                                  (MediaQuery.of(context).size.width - 60) / 2,
                              color: Color(0xff2f2e41),
                              child: Center(
                                child: Text(
                                  'Sept 2022',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
