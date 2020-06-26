// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/exam_ut/cat.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  test('Cat HuntGame Real (Real Async)', () async {
    var rcat = Cat();

    var hg1 = HuntGame(rcat);
    hg1.play1("S1");
    hg1.play1("S2");

    //there are still tasks waiting here, no idea how to flush out 
    print(rcat.foodEaten);

    
  });

  test('Cat HuntGame Real (FakeAync)', () {
    fakeAsync((async) {
      var rcat = Cat();

      var hg1 = HuntGame(rcat);
      hg1.play1("S1F");
      hg1.play1("S2F");

      //There still tasks waiting to flush, we can flush now as we have fake async
      async.flushMicrotasks();
      print(rcat.foodEaten);
    });
  });

}