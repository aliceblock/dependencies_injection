import 'package:dependencies_injection/domain/i_counter_repository.dart';
import 'package:dependencies_injection/injection.dart';
import 'package:dependencies_injection/presentation/bloc/counter_bloc.dart';
import 'package:dependencies_injection/presentation/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'injection.iconfig.dart';

void main() {
  configureInjection(Env.dev);
  runApp(Provider(
    create: (BuildContext context) {
      return CounterBloc(getIt<ICounterRepository>());
    },
    dispose: (context, CounterBloc bloc) => bloc.dispose(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}
