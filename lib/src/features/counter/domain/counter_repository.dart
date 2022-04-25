import 'package:counter_elementary/src/features/common/service/counter.dart';

abstract class ICounterRepository {
  int get currentValue;
  int decrement();
  int increment();
}

class CounterRepository implements ICounterRepository {
  final CounterStorage _counterStorage;
  @override
  int get currentValue => _counterStorage.result;
  CounterRepository(this._counterStorage);

  @override
  int decrement() {
    final newResult = currentValue - 1;
    _counterStorage.result = newResult;

    return newResult;
  }

  @override
  int increment() {
    final newResult = currentValue + 1;
    _counterStorage.result = newResult;

    return newResult;
  }
}
