import 'package:flutter/material.dart';

class PageLC extends StatefulWidget {
  PageLC({Key key}) : super(key: key);

  @override
  _PageLCState createState() => _PageLCState();
}

class _PageLCState extends State<PageLC> {
  @override
  void initState(){
    super.initState();
    print("PLC: initState");
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print("PLC: didChangeDependencies");
  }

  @override
  void reassemble(){
    super.reassemble();
    print("PLC: reassemble");
  }

  @override
  void didUpdateWidget(PageLC oldWidget){
    super.didUpdateWidget(oldWidget);
    print("PLC: didUpdateWidget");
  }

  @override
  void deactivate(){
    super.deactivate();
    print("PLC: deactivate");
  }
  @override
  void dispose() {
    super.dispose();
    print("PLC: dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page: life cycle"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Check the debug log to see details..."),
            MyTestSL(),
            MyTextSF(),
          ],
        )
      )
    );
  }
}

class MyTestSL extends StatelessWidget {
  //final String _text; 

  //const MyTestSL(this._text);

  @override
  void initState(){
    //super.initState();
    print("PLC(SL): initState");
  }

  @override
  void didChangeDependencies(){
    //super.didChangeDependencies();
    print("PLC(SL): didChangeDependencies");
  }

  @override
  void reassemble(){
    //super.reassemble();
    print("PLC(SL): reassemble");
  }

  @override
  void didUpdateWidget(Widget oldWidget){
    //super.didUpdateWidget(oldWidget);
    print("PLC(SL): didUpdateWidget");
  }

  @override
  void deactivate(){
    //super.deactivate();
    print("PLC(SL): deactivate");
  }

  @override
  void dispose() {
    //super.dispose();
    print("PLC(SL): dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("MyTextSL (StateLess)")
    );
  }
}

class MyTextSF extends StatefulWidget {
  //final String _text; 

  //MyTestSF(this._text);
  @override
  _MyTextSFState createState() => _MyTextSFState();
}

class _MyTextSFState extends State<MyTextSF> {
  @override
  void initState(){
    super.initState();
    print("PLC(SF): initState");
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print("PLC(SF): didChangeDependencies");
  }

  @override
  void reassemble(){
    super.reassemble();
    print("PLC(SF): reassemble");
  }

  @override
  void didUpdateWidget(Widget oldWidget){
    super.didUpdateWidget(oldWidget);
    print("PLC(SF): didUpdateWidget");
  }

  @override
  void deactivate(){
    super.deactivate();
    print("PLC(SF): deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("PLC(SF): dispose");
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("MyTextSF (Stateful)"),
    );
  }
}