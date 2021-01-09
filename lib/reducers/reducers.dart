import 'package:hive/hive.dart';

import '../actions/action.dart';
import '../models/todo.dart';
import '../states/states.dart';

Box<ToDoData> boxToDo = Hive.box<ToDoData>(ToDoData.dbName);

AppState appStateReducer(AppState state, action) {
  return AppState(
    bottomSelectPage: bottomSelectReducer(state, action),
    todoData: todoReducer(state, action),
  );
}

String bottomSelectReducer(AppState state, action) {
  if (action is PageChangedAction) {
    return action.pageName;
  }

  return state.bottomSelectPage;
}

List<ToDoData> todoReducer(AppState state, action) {
  if (action is TodoActionSuccess) {
    return action.todos;
  }

  if (action is TodoActionError) {
    throw (action.e);
  }

  return state.todoData;
}
