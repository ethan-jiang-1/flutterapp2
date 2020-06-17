import 'package:flutterapp2/dagger/dev_count_reposirory.dart';
import 'package:get_it/get_it.dart';

import 'count_reposirory.dart';
import 'counter_change_notifier.dart';
import 'i_counter_repository.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<CounterChangeNotifier>(
        () => CounterChangeNotifier(getIt<ICounterRepository>()))
    ..registerFactory<CounterRepository>(() => CounterRepository())
    ..registerFactory<DevCounterRepository>(() => DevCounterRepository());
  if (environment == 'dev') {
    _registerDevDependencies();
  }
  if (environment == 'prod') {
    _registerProdDependencies();
  }
}

void _registerDevDependencies() {
  getIt..registerFactory<ICounterRepository>(() => DevCounterRepository());
}

void _registerProdDependencies() {
  getIt..registerFactory<ICounterRepository>(() => CounterRepository());
}