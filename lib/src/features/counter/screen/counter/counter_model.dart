import 'package:counter_elementary/src/features/counter/service/counter_service.dart';
import 'package:elementary/elementary.dart';

/// Default Elementary model for Counter module
class CounterModel extends ElementaryModel {
  final ICounterService _counterService;
  int get initValue => _initValue;
  late int _initValue;

  CounterModel({
    required ICounterService counterService,
    required ErrorHandler errorHandler,
  })  : _counterService = counterService,
        super(errorHandler: errorHandler);

  @override
  void init() {
    _initValue = _counterService.currentValue;
    super.init();
  }

  int increment() => _counterService.increment();
  int decrement() => _counterService.decrement();
}
