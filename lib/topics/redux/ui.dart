// counter_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:maulesh_flutter_practice/topics/redux/state.dart';
import 'package:redux/redux.dart';
import 'actions.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build called ');
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Count:',
            ),
            StoreConnector<CounterState, int>(
              converter: (Store<CounterState> store) => store.state.count,
              builder: (context, count) {
                return Text(
                  '$count',
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Increment button
                StoreConnector<CounterState, VoidCallback>(
                  converter: (Store<CounterState> store) {
                    return () => store.dispatch(IncrementAction());
                  },
                  builder: (context, callback) {
                    return ElevatedButton(
                      onPressed: callback,
                      child: Text("Increment"),
                    );
                  },
                ),
                const SizedBox(width: 10),
                StoreConnector<CounterState, VoidCallback>(
                  converter: (Store<CounterState> store) {
                    return () => store.dispatch(DecrementAction());
                  },
                  builder: (context, callback) {
                    return ElevatedButton(
                      onPressed: callback,
                      child: Text("Decrement"),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
