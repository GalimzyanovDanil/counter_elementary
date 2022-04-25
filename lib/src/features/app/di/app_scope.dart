import 'package:counter_elementary/src/utils/default_error_handler.dart';
import 'package:elementary/elementary.dart';

class AppScope implements IAppScope {
  @override
  ErrorHandler get errorHandler => DefaultErrorHandler();
}

abstract class IAppScope {
  ErrorHandler get errorHandler;
}
