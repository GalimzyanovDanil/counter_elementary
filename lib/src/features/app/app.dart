import 'package:counter_elementary/src/features/app/di/app_scope.dart';
import 'package:counter_elementary/src/features/common/widgets/di_scope/di_scope.dart';
import 'package:counter_elementary/src/features/counter/screen/counter/counter_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final IAppScope _scope;

  @override
  void initState() {
    _scope = AppScope();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      factory: () => _scope,
      child: const MaterialApp(
        home: CounterScreen(),
      ),
    );
  }
}