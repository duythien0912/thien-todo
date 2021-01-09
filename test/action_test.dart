import 'package:flutter_test/flutter_test.dart';
import 'package:todos/actions/action.dart';

void main() {
  test('Test toString method', () async {
    const action = InitTodoAction();
    expect(action.toString(), action.runtimeType.toString());
  });
}
