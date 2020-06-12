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
              child: Text('Go back!'),
            ),
            RaisedButton(
              color: Color.fromARGB(100, 255, 210, 200),
              textColor: Color.fromARGB(100, 10, 50, 45),
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