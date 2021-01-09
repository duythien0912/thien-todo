import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class ToDoData extends HiveObject {
  ToDoData({
    @required this.title,
    this.complete = false,
  }) : _todoKey = '$title$complete';

  static String dbName = 'todo3';

  @HiveField(0)
  String title;

  @HiveField(1)
  bool complete;

  ToDoData copyWith({String title, bool complete}) {
    this.title = title ?? this.title;
    this.complete = complete ?? this.complete;
    return this;
  }

  final String _todoKey;

  String get todoKey => _todoKey;
}
