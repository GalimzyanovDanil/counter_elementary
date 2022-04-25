/// Класс отвечающий за хранение результата
class CounterStorage {
  static final CounterStorage _instance = CounterStorage._();
  int result = 0;
  static CounterStorage get instance => _instance;

  CounterStorage._();
}
