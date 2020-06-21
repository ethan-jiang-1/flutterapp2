import 'heater.dart';
import 'pump.dart';

class CoffeeMaker {
  final Heater _heater;
  final Pump _pump;
  final String _brand;
  final String _model;
  int _count = 0;
  bool isStart = false;

  CoffeeMaker(this._heater, this._pump, this._brand, this._model);

  Future<void> brew(void Function(String text) callback) async {
    if (isStart) {
      return;
    }

    isStart = true;

    _count++;
    StringBuffer buffer = StringBuffer();
    buffer..writeln("no.$_count")..writeln("wait heater on... ");
    callback(buffer.toString());

    buffer
      ..writeln(await _heater.on())
      ..writeln(_pump.pump())
      ..writeln("[_]P coffee... [_]P");
    callback(buffer.toString());

    await Future.delayed(Duration(milliseconds: 3000));

    buffer..writeln("down!")..writeln(" Thanks for using $_model by $_brand");

    callback(buffer.toString());

    buffer.writeln(await _heater.off());

    callback(buffer.toString());

    isStart = false;
  }
}
