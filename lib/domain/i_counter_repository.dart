import 'package:dependencies_injection/infrastructure/counter_repository.dart';
import 'package:dependencies_injection/infrastructure/dev_counter_repository.dart';
import 'package:dependencies_injection/infrastructure/mock_counter_repository.dart';
import 'package:dependencies_injection/injection.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(MockCounterRepository, env: Env.test)
@Bind.toType(DevCounterRepository, env: Env.dev)
@Bind.toType(CounterRepository, env: Env.prod)
@injectable
abstract class ICounterRepository {
  int getIncrement();
}
