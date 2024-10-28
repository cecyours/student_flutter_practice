// counter_reducer.dart
import 'package:maulesh_flutter_practice/redux/state.dart';
import 'actions.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  if (action is IncrementAction) {
    return CounterState(state.count + 1);
  } else if (action is DecrementAction) {
    return CounterState(state.count - 1);
  }

  return state;
}
