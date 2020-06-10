import 'package:flutter/material.dart';

import 'package:flutterapp2/page1/mybutton.dart';
import 'package:flutterapp2/page1/mycounter0.dart';
import 'package:flutterapp2/page1/mycounter1.dart';
import 'package:flutterapp2/page1/shoppinglist.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

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
              Navigator.pushNamed(context, '/');
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

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Page1: Example title X',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world! X '),
            ),
          ),
          Expanded(
            child: MyButton(),
          ),
          Expanded(
            child: MyCounter0(),
          ),
          Expanded(
            child: MyCounter1(),
          ),
          Expanded(
            child: ShoppingList(products: <Product>[
              Product(name: 'Eggs'),
              Product(name: 'Flour'),
              Product(name: 'Chocolate chips'),
            ],),
          ),
        ],
      ),
    );
  }
}

