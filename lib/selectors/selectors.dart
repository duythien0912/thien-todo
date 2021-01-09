import 'package:redux/redux.dart';

import '../actions/action.dart';
import '../models/todo.dart';
import '../states/states.dart';

List<ToDoData> todosSelector(AppState state) => state.todoData;

int numActiveSelector(List<ToDoData> todos) => todos.fold(0, (sum, todo) => !todo.complete ? ++sum : sum);

int numCompletedSelector(List<ToDoData> todos) => todos.fold(0, (sum, todo) => todo.complete ? ++sum : sum);

class BottomNavigationSelector {
  BottomNavigationSelector({this.bottomSelectIndex, this.onChangedPage});

  factory BottomNavigationSelector.create(Store<AppState> store) {
    void _onChangedPage(String _pageName) {
      if (store.state.bottomSelectPage != _pageName) store.dispatch(PageChangedAction(_pageName));
    }

    return BottomNavigationSelector(
      bottomSelectIndex: store.state.bottomSelectPage,
      onChangedPage: _onChangedPage,
    );
  }

  final String bottomSelectIndex;

  final Function(String) onChangedPage;
}

class ToDoSelector {
  ToDoSelector({
    this.todoData,
    this.todoDataComplete,
    this.todoDataInComplete,
    this.bottomSelectPage,
    this.onAdd,
    this.onRemove,
    this.onUpdate,
    this.onEdit,
  });

  factory ToDoSelector.create(Store<AppState> store) {
    void _onAdd(String title) {
      store.dispatch(AddToDoAction(ToDoData(title: title, complete: false)));
    }

    void _onUpdate(ToDoData todo, bool val) {
      store.dispatch(UpdateTodoAction(todo, todo.copyWith(complete: val)));
    }

    void _onRemove(ToDoData todo) {
      store.dispatch(DeleteTodoAction(todo));
    }

    void _onEdit(ToDoData todo, String title) {
      store.dispatch(UpdateTodoAction(todo, todo.copyWith(title: title)));
    }

    return ToDoSelector(
      todoData: store.state.todoData,
      todoDataComplete: store.state.todoDataComplete,
      todoDataInComplete: store.state.todoDataInComplete,
      bottomSelectPage: store.state.bottomSelectPage,
      onAdd: _onAdd,
      onUpdate: _onUpdate,
      onRemove: _onRemove,
      onEdit: _onEdit,
    );
  }

  final List<ToDoData> todoData;
  final List<ToDoData> todoDataComplete;
  final List<ToDoData> todoDataInComplete;

  final String bottomSelectPage;
  final Function(String) onAdd;

  final Function(ToDoData, bool) onUpdate;

  final Function(ToDoData) onRemove;

  final Function(ToDoData, String) onEdit;
}
