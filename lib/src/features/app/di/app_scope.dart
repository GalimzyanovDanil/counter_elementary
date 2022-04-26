import 'package:counter_elementary/src/features/common/service/counter_storage.dart';
import 'package:counter_elementary/src/features/counter/domain/counter_repository.dart';
import 'package:counter_elementary/src/features/counter/service/counter_service.dart';
import 'package:counter_elementary/src/utils/default_error_handler.dart';
import 'package:elementary/elementary.dart';

class AppScope implements IAppScope {
  late final ErrorHandler _errorHandler;
  late final CounterStorage _counterStorage;
  late final ICounterService _counterService;
  late final ICounterRepository _counterRepository;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  ICounterService get counterService => _counterService;

  AppScope() {
    _errorHandler = DefaultErrorHandler();
    _counterStorage = CounterStorage.instance;
    _counterRepository = CounterRepository(_counterStorage);
    _counterService = CounterService(_counterRepository);
  }
}

abstract class IAppScope {
  ErrorHandler get errorHandler;
  ICounterService get counterService;
}
