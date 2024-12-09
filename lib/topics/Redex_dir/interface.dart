import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:maulesh_flutter_practice/topics/Redex_dir/state_value.dart';
import 'package:redux/redux.dart';

import 'function.dart';

class Interface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux Dir"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Current Num: ", style: TextStyle(fontSize: 20),),
            StoreConnector<UpdateValue, int>(
                converter: (Store<UpdateValue> store) => store.state.count,
                builder: (context, count) {
                  return Text("${count}");
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StoreConnector<UpdateValue, VoidCallback>(
                    converter: (Store<UpdateValue> fact) {
                  return () => fact.dispatch(Multiplication());
                }, builder: (context, callback) {
                  return ElevatedButton(
                      onPressed: callback, child: Text(" * "));
                }),
                StoreConnector<UpdateValue, VoidCallback>(
                    converter: (Store<UpdateValue> fact) {
                  return () => fact.dispatch(Addition());
                }, builder: (context, callback) {
                  return ElevatedButton(
                      onPressed: callback, child: Text(" + "));
                }),
                StoreConnector<UpdateValue, VoidCallback>(
                    converter: (Store<UpdateValue> fact) {
                  return () => fact.dispatch(Subtraction());
                }, builder: (context, callback) {
                  return ElevatedButton(
                      onPressed: callback, child: Text(" - "));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
