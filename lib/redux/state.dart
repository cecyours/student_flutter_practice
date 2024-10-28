// counter_state.dart
class CounterState {
  final int count;

  CounterState(this.count);

  // Initial state of the counter
  factory CounterState.initial() {
    return CounterState(0);
  }
}
