import 'package:injectable/injectable.dart';

import 'i_counter_repository.dart';

@injectable
class DevCounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 2;
}