import 'package:counter_elementary/src/features/app/di/app_scope.dart';
import 'package:counter_elementary/src/features/counter/screen/counter/counter_model.dart';
import 'package:counter_elementary/src/features/counter/screen/counter/counter_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ICounterWidgetModel extends IWidgetModel {
  ListenableState<int> get countResult;
  void onIncrementButton();
  void onDecrementButton();
}

CounterWidgetModel defaultCounterWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final errorHandler = appDependencies.errorHandler;
  final counterService = appDependencies.counterService;

  final model = CounterModel(
    counterService: counterService,
    errorHandler: errorHandler,
  );

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

    final initValue = model.initValue;
    _countResult = StateNotifier<int>(initValue: initValue);
  }

  @override
  void onDecrementButton() {
    final result = model.decrement();
    _countResult.accept(result);
  }

  @override
  void onIncrementButton() {
    final result = model.increment();
    _countResult.accept(result);
  }
}
