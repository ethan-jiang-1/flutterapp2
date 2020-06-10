import "package:flutter/material.dart";

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2: Second Screen"),
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