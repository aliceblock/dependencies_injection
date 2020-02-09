import 'package:dependencies_injection/injection.iconfig.dart';
import 'package:injectable/injectable.dart';

@injectableInit
void configureInjection(String environment) =>
    $initGetIt(environment: environment);

abstract class Env {
  static const test = 'test';
  static const dev = 'dev';
  static const prod = 'prod';
}
