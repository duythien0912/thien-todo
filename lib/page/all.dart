import 'package:flutter/material.dart';

import '../widgets/listTodo.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key key}) : super(key: key);

  static String routeName = '${const AllScreen().runtimeType}';

  @override
  Widget build(BuildContext context) {
    return ListTodo(
      key: ValueKey(routeName),
      routeName: routeName,
    );
  }
}
