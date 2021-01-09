import 'package:flutter/material.dart';
import 'package:todos/widgets/listTodo.dart';

class IncompleteScreen extends StatelessWidget {
  const IncompleteScreen({Key key}) : super(key: key);

  static String routeName = '${const IncompleteScreen().runtimeType}';

  @override
  Widget build(BuildContext context) {
    return ListTodo(
      key: ValueKey(routeName),
      routeName: routeName,
    );
  }
}
