// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/coffee/coffee_component.dart';
import 'package:flutterapp2/coffee/coffee_maker.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  test('CoffeeMaker real', () {
    List<String> _msgs = List<String>();
    print("Run test real");
    CoffeeComponent _coffeeComponent = CoffeeComponent();
    _coffeeComponent.init();
    CoffeeMaker _coffeeMaker = _coffeeComponent.getCoffeeMaker();

    _coffeeMaker.brew((text)=>{print(text), _msgs.add(text)});

    print("Msgs we have got: " + _msgs.toString() ); 
  });

  test('CoffeeMaker real (fake async)', () {
    fakeAsync( (async) {
      List<String> _msgs = List<String>();

      print("Run test fake async");
      CoffeeComponent _coffeeComponent = CoffeeComponent();
      _coffeeComponent.init();
      CoffeeMaker _coffeeMaker = _coffeeComponent.getCoffeeMaker();

      _coffeeMaker.brew((text)=> { print(text), _msgs.add(text)});

      print("before flush: " + _msgs.toString() ); 
      async.elapse(Duration(seconds: 10));     
      async.flushMicrotasks();
      print("after flush: " + _msgs.toString());      
    });

  });

}