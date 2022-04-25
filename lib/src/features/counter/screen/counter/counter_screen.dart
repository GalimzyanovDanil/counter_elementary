import 'package:counter_elementary/src/features/counter/screen/counter/counter_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';



/// Main widget for Counter module
class CounterScreen extends ElementaryWidget<ICounterWidgetModel> {
  const CounterScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultCounterWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICounterWidgetModel wm) {
    return Scaffold(
      body: Center(
        child: StateNotifierBuilder<int>(
          listenableState: wm.countResult,
          builder: (_, value) {
            return Text(
              '${value ?? 0}',
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => wm.onIncrementButton(),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => wm.onDecrementButton(),
          ),
        ],
      ),
    );
  }
}
