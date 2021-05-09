import 'package:flutter/material.dart';

class VerificationWidget extends StatelessWidget {
  final Function onpress;
  final String fst;
  final String snd;
  final bg = 'assets/bg.png';
  VerificationWidget({this.onpress, this.fst, this.snd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff2f2e41),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      bg,
                      height: 50,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          fst,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: InkWell(
                    onTap: null,
                    child: Center(
                      child: Text(
                        snd,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff19CA55)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
