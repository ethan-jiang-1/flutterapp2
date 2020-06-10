import "package:flutter/material.dart";

class MyAppBar0 extends StatelessWidget {
  MyAppBar0({this.title});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: () {
              print("pressMenu");
              Navigator.pushNamed(context, '/page2');
            },
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                print("pressSearch");
              }
          ),
        ],
      ),
    );
  }
}
class MyButton0 extends StatelessWidget {
  final String _name;

  MyButton0(this._name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped! {$_name)');
        Navigator.pushNamed(context, _name);
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Jump to $_name'),
        ),
      ),
    );
  }
}

class Page0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          children: <Widget>[
            MyAppBar0(
              title: Text(
                'Example title X',
                style: Theme.of(context).primaryTextTheme.headline6,),
            ),
            Expanded(
              child: Center (
                child: MyButton0('/page1'),
              ),
            ),
            Expanded(
              child: Center (
                child: MyButton0('/page2'),
              ),
            ),
          ],
        ),
    );
  }
}