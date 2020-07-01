import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class iPhone678Plus1 extends StatelessWidget {
  iPhone678Plus1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-7.0, -12.0),
            child: Container(
              width: 428.0,
              height: 743.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.74), BlendMode.dstIn),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 82.0),
            child: Container(
              width: 386.0,
              height: 417.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(3, 10),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(118.0, 82.0),
            child: Container(
              width: 186.0,
              height: 37.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(15.0),
                ),
                color: const Color(0xffe6e6e6),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(214.0, 82.0),
            child: Container(
              width: 186.0,
              height: 58.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(15.0),
                ),
                color: const Color(0xffe6e6e6),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 82.0),
            child: Container(
              width: 200.0,
              height: 58.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(20.0),
                ),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 518.0),
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 386.0,
                  height: 77.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0x1479edff),
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
