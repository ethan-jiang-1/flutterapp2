import 'heater.dart';

class PowerOutlet {}

class Electricity {
  Electricity(PowerOutlet outlet);
}

class ElectricHeater implements Heater {
  ElectricHeater(Electricity electricity);

  bool _heating = false;

  @override
  Future<String> on() async {
    await Future.delayed(Duration(milliseconds: 2000));
    _heating = true;
    return "heating!";
  }

  @override
  Future<String> off() async {
    await Future.delayed(Duration(milliseconds: 2000));
    _heating = false;
    return "heater off!";
  }

  @override
  bool get isHot {
    return _heating;
  }
}
