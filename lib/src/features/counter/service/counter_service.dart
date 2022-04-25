import 'package:counter_elementary/src/features/counter/domain/counter_repository.dart';

abstract class ICounterService {
  int get currentValue;
  int decrement();
  int increment();
}

class CounterService implements ICounterService {
  final ICounterRepository _counterRepository;
  @override
  int get currentValue => _counterRepository.currentValue;
  CounterService(this._counterRepository);

  @override
  int decrement() => _counterRepository.decrement();

  @override
  int increment() => _counterRepository.increment();
}
