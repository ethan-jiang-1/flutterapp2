import 'heater.dart';
import 'pump.dart';

class Thermosiphon implements Pump {
  final Heater _heater;

  Thermosiphon(this._heater);

  @override
  String pump() {
    if (_heater.isHot) {
      return "pumping water";
    } else {
      return "heater error!";
    }
  }
}
