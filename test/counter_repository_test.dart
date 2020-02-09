import 'package:dependencies_injection/domain/i_counter_repository.dart';
import 'package:dependencies_injection/injection.dart';
import 'package:dependencies_injection/injection.iconfig.dart';
import 'package:dependencies_injection/presentation/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  setUpAll(() {
    configureInjection(Env.test);
  });

  test('Increase counter', () {
    final increaseValue = 123;
    final mockCounterRepository = getIt<ICounterRepository>();
    when(mockCounterRepository.getIncrement()).thenReturn(increaseValue);
    final counterBloc = CounterBloc(mockCounterRepository);
    final startWith = counterBloc.currentCounter;

    counterBloc.increaseCounter();

    verify(mockCounterRepository.getIncrement()).called(1);
    expect(startWith, equals(0));
    expect(counterBloc.currentCounter, equals(increaseValue));
  });
}
