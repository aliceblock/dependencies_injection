import 'dart:async';

import 'package:dependencies_injection/domain/i_counter_repository.dart';

class CounterBloc {
  int _counter = 0;
  ICounterRepository _counterRepository;

  CounterBloc(this._counterRepository);

  StreamController<int> _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  int get currentCounter => _counter;

  increaseCounter() {
    _counter += _counterRepository.getIncrement();
    _counterController.sink.add(_counter);
  }

  decrementCounter() {
    _counter -= _counterRepository.getIncrement();
    _counterController.sink.add(_counter);
  }

  dispose() {
    _counterController.close();
  }
}
