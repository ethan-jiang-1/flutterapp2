import 'package:flutter/material.dart';

import 'mybutton.dart';
import 'mycounter0.dart';
import 'mycounter1.dart';
import 'shoppinglist.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
      ),
      body: Center(
        // Column is a vertical, linear layout.
        child: Column(
          children: <Widget>[
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
              child: ShoppingList(
                products: <Product>[
                  Product(name: 'Eggs'),
                  Product(name: 'Flour'),
                  Product(name: 'Chocolate chips'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
