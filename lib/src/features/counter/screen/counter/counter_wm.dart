import 'package:counter_elementary/src/features/app/di/app_scope.dart';
import 'package:counter_elementary/src/features/counter/screen/counter/counter_model.dart';
import 'package:counter_elementary/src/features/counter/screen/counter/counter_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ICounterWidgetModel extends IWidgetModel {
  ListenableState<int> get countResult;
  void increment();
  void decrement();
}

CounterWidgetModel defaultCounterWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final errorHandler = appDependencies.errorHandler;
  final model = CounterModel(errorHandler);

  return CounterWidgetModel(model);
}

/// Default widget model for CounterWidget
class CounterWidgetModel extends WidgetModel<CounterScreen, CounterModel>
    implements ICounterWidgetModel {
  late final StateNotifier<int> _countResult;
  @override
  ListenableState<int> get countResult => _countResult;

  CounterWidgetModel(CounterModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    final initValue = model.result;
    _countResult = StateNotifier<int>(initValue: initValue);
  }

  @override
  void decrement() {
    final result = model.decrement();
    _countResult.accept(result);
  }

  @override
  void increment() {
    final result = model.increment();
    _countResult.accept(result);
  }
}
