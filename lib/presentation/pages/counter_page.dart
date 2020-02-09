import 'package:dependencies_injection/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc _counterBloc;

  @override
  void didChangeDependencies() {
    _counterBloc = Provider.of<CounterBloc>(context);
    super.didChangeDependencies();
  }

  void _incrementCounter() {
    _counterBloc.increaseCounter();
  }

  void _decrementCounter() {
    _counterBloc.decrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Injection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: _counterBloc.counterStream,
                initialData: _counterBloc.currentCounter,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onLongPress: _decrementCounter,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
