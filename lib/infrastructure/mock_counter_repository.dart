import 'package:dependencies_injection/domain/i_counter_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@injectable
class MockCounterRepository extends Mock implements ICounterRepository {}
