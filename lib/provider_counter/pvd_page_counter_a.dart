import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'counter_provider.dart';
 
class PvdCounterPageA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PvdCounterPageAState();
}
 
class PvdCounterPageAState extends State<PvdCounterPageA> {
  ///初始化CounterProvider
  CounterProvider _counterProvider = new CounterProvider();
 
  @override
  Widget build(BuildContext context) {
    print('页面重绘了。。。。。。。。。。。');
 
    //整个页面使用ChangeNotifier来包裹
    return ChangeNotifierProvider(
      create: (context) => _counterProvider,
      child:
          //child里面的内容不会因为数据的改变而重绘
          Scaffold(
        appBar: AppBar(
          title: Text('Page Provider -> Comsumer'),
        ),
        body: Center(
            child:
                //使用Cousumer来获取Provider
                Column(
          children: <Widget>[
            //使用Consumer来获取CounterProvider，为Text提供数据
            Consumer(builder: (BuildContext context,
                CounterProvider counterProvider, Widget child) {
              print('Text1重绘了。。。。。。');
 
              return Text(
                //获取数据
                'Text1 : ${counterProvider.value0}',
                style: TextStyle(fontSize: 20),
              );
            }),
            //使用Consumer来获取CounterProvider，为Text提供数据
            Consumer(builder: (BuildContext context,
                CounterProvider counterProvider, Widget child) {
              print('Text2重绘了。。。。。。');
 
              return Text(
                //获取数据
                'Text2 : ${counterProvider.value1}',
                style: TextStyle(fontSize: 20),
              );
            }),
            RaisedButton(
              onPressed: () {
                print('Button 1被点击了。。。。。。。。。。');
                _counterProvider.increment0();
              },
              child: Text('Button1'),
            ),
            RaisedButton(
              onPressed: () {
                print('Button 2被点击了。。。。。。。。。。');
                _counterProvider.increment1();
              },
              child: Text('Button2'),
            )
          ],
        )),
      ),
    );
  }
}