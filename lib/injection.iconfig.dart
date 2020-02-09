// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dependencies_injection/domain/i_counter_repository.dart';
import 'package:dependencies_injection/infrastructure/dev_counter_repository.dart';
import 'package:dependencies_injection/infrastructure/counter_repository.dart';
import 'package:dependencies_injection/infrastructure/mock_counter_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<DevCounterRepository>(() => DevCounterRepository())
    ..registerFactory<CounterRepository>(() => CounterRepository())
    ..registerFactory<MockCounterRepository>(() => MockCounterRepository());
  if (environment == 'test') {
    _registerTestDependencies();
  }
  if (environment == 'dev') {
    _registerDevDependencies();
  }
  if (environment == 'prod') {
    _registerProdDependencies();
  }
}

void _registerTestDependencies() {
  getIt..registerFactory<ICounterRepository>(() => MockCounterRepository());
}

void _registerDevDependencies() {
  getIt..registerFactory<ICounterRepository>(() => DevCounterRepository());
}

void _registerProdDependencies() {
  getIt..registerFactory<ICounterRepository>(() => CounterRepository());
}
