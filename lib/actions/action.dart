import 'package:todos/models/todo.dart';

class TodoAction {
  const TodoAction();
}

class InitTodoAction {
  const InitTodoAction();

  @override
  String toString() {
    return '$runtimeType';
  }
}

class TodoActionSuccess {
  TodoActionSuccess(this.todos);

  final List<ToDoData> todos;
}

class TodoActionError {
  const TodoActionError(this.e);

  final Exception e;
}

class AddToDoAction {
  const AddToDoAction(this.todo);

  final ToDoData todo;
}

class UpdateTodoAction {
  const UpdateTodoAction(this.todo, this.todoUpdate);

  final ToDoData todo;
  final ToDoData todoUpdate;
}

class DeleteTodoAction {
  const DeleteTodoAction(this.todo);

  final ToDoData todo;
}

class ClearAction {
  const ClearAction();
}

class PageChangedAction {
  const PageChangedAction(this.pageName);

  final String pageName;
}
