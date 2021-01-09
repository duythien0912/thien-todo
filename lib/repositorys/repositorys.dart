import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todos/actions/action.dart';
import 'package:todos/models/todo.dart';

class TodoRepositorys {
  Box<ToDoData> boxToDo;

  Future<Box<ToDoData>> init({bool isFlutter = true}) async {
    if (!isFlutter) Hive.init(Directory.current.path);
    Hive.registerAdapter(ToDoDataAdapter());

    await Hive.openBox<ToDoData>(ToDoData.dbName);
    boxToDo = Hive.box<ToDoData>(ToDoData.dbName);
    return boxToDo;
  }

  List<ToDoData> get todos => boxToDo.values.toList().reversed.toList();
  Stream<dynamic> initTodo(InitTodoAction action) async* {
    try {
      if (action is InitTodoAction) {
        yield TodoActionSuccess(todos);
      }
    } on Exception catch (e) {
      yield TodoActionError(e);
    }
  }

  Future add(ToDoData todo) async => await boxToDo.add(ToDoData(title: todo.title.trim(), complete: todo.complete));
  Stream<dynamic> addToDo(AddToDoAction action) async* {
    try {
      await add(ToDoData(title: action.todo.title.trim(), complete: action.todo.complete));
      yield TodoActionSuccess(todos);
    } on Exception catch (e) {
      yield TodoActionError(e);
    }
  }

  Future update(ToDoData todo, ToDoData todoUpdate) async {
    await todo.copyWith(title: todoUpdate.title, complete: todoUpdate.complete).save();
  }

  Stream<dynamic> updateTodo(UpdateTodoAction action) async* {
    try {
      await update(action.todo, action.todoUpdate);
      yield TodoActionSuccess(todos);
    } on Exception catch (e) {
      yield TodoActionError(e);
    }
  }

  Future delete(ToDoData todo) async => await todo.delete();
  Stream<dynamic> deleteTodo(DeleteTodoAction action) async* {
    try {
      await delete(action.todo);
      yield TodoActionSuccess(todos);
    } on Exception catch (e) {
      yield TodoActionError(e);
    }
  }

  Future clear() async => await boxToDo.clear();
  Stream<dynamic> clearAction(ClearAction action) async* {
    try {
      await clear();
      yield TodoActionSuccess(todos);
    } on Exception catch (e) {
      yield TodoActionError(e);
    }
  }
}
