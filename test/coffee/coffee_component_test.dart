// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/coffee/coffee_component.dart';
import 'package:flutterapp2/coffee/coffee_maker.dart';

void main() {
  test('Counter value should be incremented', () {
    print("Run test");
    CoffeeComponent _coffeeComponent = CoffeeComponent();
    _coffeeComponent.init();
    CoffeeMaker _coffeeMaker = _coffeeComponent.getCoffeeMaker();

    _coffeeMaker.brew((text)=>print(text));

  });
}