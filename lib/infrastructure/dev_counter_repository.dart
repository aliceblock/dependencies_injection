import 'package:dependencies_injection/domain/i_counter_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DevCounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 2;
}
