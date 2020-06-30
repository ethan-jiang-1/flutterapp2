import 'package:flutter/material.dart';

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
            offset: Offset(127.0, 27.0),
            child: Text(
              '明天天气怎么样？',
              style: TextStyle(
                fontFamily: '.PingFang SC',
                fontSize: 20,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(32.0, 316.0),
            child: Text(
              'arrangement in order of importance',
              style: TextStyle(
                fontFamily: '.PingFang SC',
                fontSize: 20,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 437.0),
            child: Text(
              'arrangement in order of importance',
              style: TextStyle(
                fontFamily: 'Aller',
                fontSize: 22,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 581.0),
            child: Text(
              'arrangement in order of importance',
              style: TextStyle(
                fontFamily: 'Dosis',
                fontSize: 26,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(87.0, 166.0),
            child: Text(
              '明天天气怎么样？',
              style: TextStyle(
                fontFamily: 'FZYaZhuTiJF',
                fontSize: 30,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w800,
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 71.0),
            child: SizedBox(
              width: 333.0,
              height: 91.0,
              child: Text(
                '明天可能会下雨，温度在27摄氏度左右，请注意穿衣服，人多的地方尽量不要去，出门记得戴口罩！~~~~',
                style: TextStyle(
                  fontFamily: '.PingFang SC',
                  fontSize: 10,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 360.0),
            child: SizedBox(
              width: 333.0,
              height: 43.0,
              child: Text(
                'If you work as a soda jerker, you will, of course, not need much skill in expressing yourself to be effective. If you work on a machine, your ability to express yourself will be of little importance',
                style: TextStyle(
                  fontFamily: '.PingFang SC',
                  fontSize: 10,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 481.0),
            child: SizedBox(
              width: 333.0,
              height: 43.0,
              child: Text(
                'If you work as a soda jerker, you will, of course, not need much skill in expressing yourself to be effective. If you work on a machine, your ability to express yourself will be of little importance',
                style: TextStyle(
                  fontFamily: 'Aller',
                  fontSize: 10,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 631.0),
            child: SizedBox(
              width: 333.0,
              height: 43.0,
              child: SingleChildScrollView(
                  child: Text(
                'If you work as a soda jerker, you will, of course, not need much skill in expressing yourself to be effective. If you work on a machine, your ability to express yourself will be of little importance',
                style: TextStyle(
                  fontFamily: 'Dosis',
                  fontSize: 15,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.left,
              )),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 217.0),
            child: SizedBox(
              width: 333.0,
              height: 91.0,
              child: Text(
                '明天可能会下雨，温度在27摄氏度左右，请注意穿衣服，人多的地方尽量不要去，出门记得戴口罩！~~~~',
                style: TextStyle(
                  fontFamily: 'FZYaZhuTiJF',
                  fontSize: 14,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w800,
                  shadows: [
                    Shadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
