import 'package:flutter/material.dart';
import 'package:adobe_xd/specific_rect_clip.dart';

class iPhone678Plus2 extends StatelessWidget {
  iPhone678Plus2({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 414.0,
            height: 84.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.55, -0.12),
                end: Alignment(0.43, 0.29),
                colors: [const Color(0xff7da1e9), const Color(0xffbc86e1)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(23.0, 109.0),
            child: SpecificRectClip(
              rect: Rect.fromLTWH(0, 0, 360, 610),
              child: UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 360,
                  height: 598,
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.all(0),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 1,
                    childAspectRatio: 4.3373,
                    children: [
                      {
                        'fill': const Color(0xff707070),
                        'text': '今朝有酒今朝醉',
                      },
                      {
                        'fill': const Color(0xff707070),
                        'text': '今朝有酒今朝醉',
                      },
                      {
                        'fill': const Color(0xff707070),
                        'text': '今朝有酒今朝醉',
                      },
                      {
                        'fill': const Color(0xff707070),
                        'text': '今朝有酒今朝醉',
                      },
                      {
                        'fill': const Color(0xff707070),
                        'text': '今朝有酒今朝醉',
                      },
                      {
                        'fill': const Color(0xff707070),
                        'text': '今朝有酒今朝醉',
                      },
                    ].map((map) {
                      final fill = map['fill'];
                      final text = map['text'];
                      return Transform.translate(
                        offset: Offset(-23.0, -109.0),
                        child: Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(23.0, 109.0),
                              child:
                                  // Adobe XD layer: '01' (shape)
                                  Container(
                                width: 83.0,
                                height: 83.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(41.5, 41.5)),
                                  image: DecorationImage(
                                    image: fill,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(117.0, 120.0),
                              child:
                                  // Adobe XD layer: 'ceshi01' (text)
                                  Text(
                                text,
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(332.0, 126.0),
                              child: Text(
                                '0.3km',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 16,
                                  color: const Color(0xff707070),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(117.0, 154.0),
                              child: SizedBox(
                                width: 266.0,
                                height: 23.0,
                                child: Text(
                                  '今朝有酒今朝醉',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    color: const Color(0xff707070),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
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
