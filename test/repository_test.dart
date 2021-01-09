import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:todos/models/todo.dart';
import 'package:todos/repositorys/repositorys.dart';

void main() {
  TodoRepositorys repository;

  setUpAll(() async {
    repository = TodoRepositorys();
    await repository.init(isFlutter: false);
    await Hive.box<ToDoData>(ToDoData.dbName).clear();
  });

  group('State Reducer', () {
    test('should remove todo from the list in response to a DeleteTodoAction', () async {
      final ToDoData todo = ToDoData(title: 'Remove this todo', complete: false);

      await repository.add(todo);

      expect(repository.todos.first.todoKey, [todo].first.todoKey);

      await repository.delete(repository.todos.first);

      expect(repository.todos, []);
    });

    test('should update todo from the list in response to a UpdateTodoAction', () async {
      final ToDoData todo = ToDoData(title: 'Update this todo', complete: false);

      await repository.add(todo);

      expect(repository.todos.first.todoKey, [todo].first.todoKey);

      await repository.update(repository.todos.first, todo.copyWith(complete: true));

      expect(repository.todos.first.todoKey, todo.copyWith(complete: true).todoKey);

      await repository.update(repository.todos.first, todo.copyWith(complete: false));

      expect(repository.todos.first.todoKey, todo.copyWith(complete: false).todoKey);

      await repository.update(repository.todos.first, todo.copyWith(title: 'Already update it 💪'));

      expect(repository.todos.first.todoKey, todo.copyWith(title: 'Already update it 💪').todoKey);
    });

    test('should clean todo from the list in response to a ClearAction', () async {
      final ToDoData todo = ToDoData(title: 'clean this todo', complete: false);

      await repository.add(todo);

      expect(repository.todos.first.todoKey, [todo].first.todoKey);

      await repository.clear();

      expect(repository.todos, []);

      await repository.add(todo);
      await repository.add(todo);
      await repository.add(todo);

      expect(repository.todos.length, 3);

      await repository.clear();

      expect(repository.todos, []);
    });
  });
}
