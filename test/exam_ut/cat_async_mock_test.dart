// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/exam_ut/cat.dart';
import 'package:mockito/mockito.dart';

class MockCat extends Mock implements Cat {}
void main() {
  test('Cat HuntGame Mock', () async {
    var mcat = MockCat();
    when(mcat.eatFood(any)).thenReturn(false);
    var hg2 = HuntGame(mcat);
    hg2.play1("SA");
    hg2.play1("SB");
    
  });

}