import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../page/all.dart';

class AppState extends Equatable {
  AppState({
    @required this.bottomSelectPage,
    @required this.todoData,
  })  : todoDataComplete = todoData.where((element) => element.complete == true).toList(),
        todoDataInComplete = todoData.where((element) => element.complete == false).toList();

  static AppState initialState() {
    return AppState(
      bottomSelectPage: AllScreen.routeName,
      todoData: [],
    );
  }

  final String bottomSelectPage;
  final List<ToDoData> todoData;
  final List<ToDoData> todoDataComplete;
  final List<ToDoData> todoDataInComplete;

  AppState copyWith({String bottomSelectPage, List<ToDoData> todoData}) {
    return AppState(
      bottomSelectPage: bottomSelectPage ?? this.bottomSelectPage,
      todoData: todoData ?? this.todoData,
    );
  }

  @override
  List<Object> get props => [bottomSelectPage, todoData];
}
