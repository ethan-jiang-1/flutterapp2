import 'package:injectable/injectable.dart';

import 'i_counter_repository.dart';

@injectable
class CounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 1;
}