import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'counter_provider.dart';
 
class PvdCounterPageB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PvdCounterPageBState();
}
 
class PvdCounterPageBState extends State<PvdCounterPageB> {
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
          title: Text('Page Provider -> Selector'),
        ),
        body: Center(
            child:
                //使用Cousumer来获取Provider
                Column(
          children: <Widget>[
            //用Selector替换Consumer
            Selector(
                builder: (BuildContext context, int data, Widget child) {
                  print('Text 1 重绘了。。。。。。。。。。');
                  return Text(
                    //获取数据
                      'Text1 : ${data.toString()}',
                      style: TextStyle(fontSize: 20));
                }, 
                selector: (BuildContext context, CounterProvider counterProvider) {
                  //这个地方返回具体的值，对应builder中的data
                  return counterProvider.value0;
                }
            ),
            Selector(
                builder: (BuildContext context, int data, Widget child) {
                  print('Text 2 重绘了。。。。。。。。。。');
                  return Text(
                    //获取数据
                    'Text2 : ${data.toString()}',
                    style: TextStyle(fontSize: 20),
                  );
                },
                selector: (BuildContext context, CounterProvider counterProvider) {
                  return counterProvider.value1;
                }
            ),
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