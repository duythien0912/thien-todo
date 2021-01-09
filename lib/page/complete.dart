import 'package:flutter/material.dart';

import '../widgets/listTodo.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({Key key}) : super(key: key);

  static String routeName = '${const CompleteScreen().runtimeType}';

  @override
  Widget build(BuildContext context) {
    return ListTodo(
      key: ValueKey(routeName),
      routeName: routeName,
    );
  }
}
