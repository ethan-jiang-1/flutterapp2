import 'package:get_it/get_it.dart';

import 'coffee_maker.dart';
import 'electric_heater.dart';
import 'heater.dart';
import 'pump.dart';
import 'thermosiphon.dart';

class CoffeeComponent {
  final GetIt _getIt;

  CoffeeComponent() : _getIt = GetIt.asNewInstance();

  void init() {
    _getIt.registerFactory<PowerOutlet>(() => PowerOutlet());
    _getIt.registerFactory<Electricity>(
        () => Electricity(_getIt.get<PowerOutlet>()));

    _getIt.registerSingleton<Heater>(ElectricHeater(_getIt.get<Electricity>()));
    _getIt.registerSingleton<Pump>(Thermosiphon(_getIt.get<Heater>()));
    _getIt.registerSingleton<String>("Coffee by Dart Inc.",
        instanceName: "brandName");
    _getIt.registerSingleton<String>("DripCoffeeStandard",
        instanceName: "modelName");

    Heater heater = _getIt.get<Heater>();
    Pump pump = _getIt.get<Pump>();
    String brand = _getIt.get<String>(instanceName: "brandName");
    String model = _getIt.get<String>(instanceName: "modelName");
    _getIt.registerSingleton<CoffeeMaker>(
        CoffeeMaker(heater, pump, brand, model));
  }

  void deInit() {
    _getIt.reset();
  }

  CoffeeMaker getCoffeeMaker() => _getIt.get<CoffeeMaker>();
}
