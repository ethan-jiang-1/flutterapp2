import "package:flutter/material.dart";

class PageTab0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageTab0: Tab Page 0"),
      ),
      body: Center(
        child: Column(
            children:<Widget> [
              RaisedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped.
                  Navigator.pop(context);
                },
                child: Text('Go back!'),),
              RaisedButton(
                onPressed: () {
                  print("do some work");
                },
                child: Text('Do some work'),
              ),
            ]
        ),
      ),
    );
  }
}