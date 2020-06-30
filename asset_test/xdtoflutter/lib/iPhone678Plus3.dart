import 'package:flutter/material.dart';

class iPhone678Plus3 extends StatelessWidget {
  iPhone678Plus3({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(19.0, 194.0),
            child:
                // Adobe XD layer: 'ef15bb38032521.5754…' (shape)
                Container(
              width: 367.0,
              height: 260.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(137.0, 500.0),
            child: Text(
              '冰箱忘插电了！',
              style: TextStyle(
                fontFamily: '.PingFang SC',
                fontSize: 20,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
