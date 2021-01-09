import 'package:flutter_test/flutter_test.dart';
import 'package:todos/models/todo.dart';
import 'package:todos/selectors/selectors.dart';

void main() {
  group('Selectors', () {
    test('should calculate the number of active todos', () {
      final todos = [
        ToDoData(title: 'a'),
        ToDoData(title: 'b'),
        ToDoData(title: 'c', complete: true),
      ];

      expect(numActiveSelector(todos), 2);
    });
  });

  test('should calculate the number of completed todos', () {
    final todos = [
      ToDoData(title: 'a'),
      ToDoData(title: 'b'),
      ToDoData(title: 'c', complete: true),
    ];

    expect(numCompletedSelector(todos), 1);
  });
}
