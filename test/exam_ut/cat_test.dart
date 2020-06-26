// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/exam_ut/cat.dart';
import 'package:mockito/mockito.dart';

class MockCat extends Mock implements Cat {}
void main() {
  test('Cat mock basic', () {

    var cat = MockCat();
    cat.sound();
    verify(cat.sound());

    when(cat.sound()).thenReturn("Purr");
    expect(cat.sound(), "Purr");
  });

  test('Cat mock advanced', () {
    var cat = MockCat();

    //expect(cat.sound(), nullValue);

    // Stub a mock method before interacting.
    when(cat.sound()).thenReturn("Purr");
    expect(cat.sound(), "Purr");

    // You can call it again.
    expect(cat.sound(), "Purr");

    // Let's change the stub.
    when(cat.sound()).thenReturn("Meow");
    expect(cat.sound(), "Meow");

    // You can stub getters.
    when(cat.lives).thenReturn(9);
    expect(cat.lives, 9);

    // You can stub a method to throw.
    when(cat.lives).thenThrow(RangeError('Boo'));
    expect(() => cat.lives, throwsRangeError);

    // We can calculate a response at call time.
    //var responses = ["Purr", "Meow"];
    //when(cat.sound()).thenAnswer(() => { return responses.removeAt(0)});
    //expect(cat.sound(), "Purr");
    //expect(cat.sound(), "Meow");
  });

  test('Cat mock future', () async {
    var rcat = Cat();
    await rcat.chew();

    var cat = MockCat();
    await cat.chew(); //nothing happens

    when(cat.chew())
      .thenAnswer((_) => Future.value({print("Mock Chewing...")}));
    await cat.chew();
  });

  test('Cat mock machers', () {
    var cat = MockCat();
    // You can use plain arguments themselves
    when(cat.eatFood("fish")).thenReturn(true);

    // ... including collections
    when(cat.walk(["roof","tree"])).thenReturn(2);

    // ... or matchers
    when(cat.eatFood(argThat(startsWith("dry")))).thenReturn(false);

    // ... or mix aguments with matchers
    when(cat.eatFood(argThat(startsWith("dry")), hungry: true)).thenReturn(true);
    expect(cat.eatFood("fish"), isTrue);
    expect(cat.walk(["roof","tree"]), equals(2));
    expect(cat.eatFood("dry food"), isFalse);
    expect(cat.eatFood("dry food", hungry: true), isTrue);

    // You can also verify using an argument matcher.
    verify(cat.eatFood("fish"));
    verify(cat.walk(["roof","tree"]));
    verify(cat.eatFood(argThat(contains("food"))));

    // You can verify setters.
    cat.lives = 9;
    verify(cat.lives=9); 

    //verify(cat.hunt("backyard", null)); // OK: no arg matchers.
    //verify(cat.hunt(argThat(contains("yard")), null)); // BAD: adjacent null.
    //verify(cat.hunt(argThat(contains("yard")), argThat(isNull))); // OK: wrapped in an arg matcher.
    //verify(cat.eatFood("Milk", hungry: null)); // BAD: null as a named argument.
    //verify(cat.eatFood("Milk", hungry: argThat(isNull))); // BAD: null as a named argument.       
  });

  test('Cat mock named argument', () async {
    var cat = MockCat();
    when(cat.eatFood(any, hungry: anyNamed('hungry'))).thenReturn(true);
    when(cat.eatFood(any, hungry: argThat(isNotNull, named: 'hungry'))).thenReturn(false);
    when(cat.eatFood(any, hungry: captureAnyNamed('hungry'))).thenReturn(false);
    when(cat.eatFood(any, hungry: captureThat(isNotNull, named: 'hungry'))).thenReturn(true);
  });
}