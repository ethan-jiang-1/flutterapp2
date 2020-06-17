import 'package:flutterapp2/dagger/injection.dart';
import 'package:injectable/injectable.dart';

import 'count_reposirory.dart';
import 'dev_count_reposirory.dart';

@Bind.toType(DevCounterRepository, env: Env.dev)
@Bind.toType(CounterRepository, env: Env.prod)
@injectable
abstract class ICounterRepository {
  int getIncrement();
}