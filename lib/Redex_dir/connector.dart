import 'package:maulesh_flutter_practice/Redex_dir/function.dart';
import 'package:maulesh_flutter_practice/Redex_dir/state_value.dart';

UpdateValue reflectValue(UpdateValue state, dynamic action) {
  if (action is Multiplication) {
    return UpdateValue(count: state.count * 2);
  } else if (action is Addition) {
    return UpdateValue(count: state.count + 2);
  } else if (action is Subtraction) {
    return UpdateValue(count: state.count - 2);
  } else {
    return state;
  }
}
