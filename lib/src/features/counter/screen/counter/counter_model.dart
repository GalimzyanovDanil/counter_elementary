import 'package:elementary/elementary.dart';

/// Default Elementary model for Counter module
class CounterModel extends ElementaryModel {
  int get result => _result;

  late int _result;

  CounterModel(ErrorHandler errorHandler) : super(errorHandler: errorHandler);

  @override
  void init() {
    _result = 0;
    super.init();
  }

  int increment() => _result = _result + 1;
  int decrement() => _result = _result - 1;
}
