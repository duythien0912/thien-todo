import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todos/actions/action.dart';
import 'package:todos/models/todo.dart';
import 'package:todos/repositorys/repositorys.dart';
import 'package:todos/states/states.dart';

final Box<ToDoData> boxToDo = Hive.box<ToDoData>(ToDoData.dbName);

Epic<AppState> epics(TodoRepositorys todoRepositorys) {
  return combineEpics<AppState>([
    todoEpic(todoRepositorys),
    addToDoEpic(todoRepositorys),
    updateTodoEpic(todoRepositorys),
    deleteTodoEpic(todoRepositorys),
    clearEpic(todoRepositorys),
  ]);
}

Epic<AppState> todoEpic(TodoRepositorys todoRepositorys) =>
    (Stream<dynamic> actions, _) =>
        actions.whereType<InitTodoAction>().switchMap(todoRepositorys.initTodo);
Epic<AppState> addToDoEpic(TodoRepositorys todoRepositorys) =>
    (Stream<dynamic> actions, _) =>
        actions.whereType<AddToDoAction>().switchMap(todoRepositorys.addToDo);
Epic<AppState> updateTodoEpic(TodoRepositorys todoRepositorys) =>
    (Stream<dynamic> actions, _) => actions
        .whereType<UpdateTodoAction>()
        .switchMap(todoRepositorys.updateTodo);
Epic<AppState> deleteTodoEpic(TodoRepositorys todoRepositorys) =>
    (Stream<dynamic> actions, _) => actions
        .whereType<DeleteTodoAction>()
        .switchMap(todoRepositorys.deleteTodo);
Epic<AppState> clearEpic(TodoRepositorys todoRepositorys) =>
    (Stream<dynamic> actions, _) =>
        actions.whereType<ClearAction>().switchMap(todoRepositorys.clearAction);
