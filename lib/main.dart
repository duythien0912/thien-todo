import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todos/page/about.dart';
import 'package:todos/repositorys/repositorys.dart';

import 'actions/action.dart';
import 'app.dart';
import 'epics/epics.dart';
import 'models/todo.dart';
import 'reducers/reducers.dart';
import 'states/states.dart';
import 'styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final TodoRepositorys todoRepositorys = TodoRepositorys();
  await todoRepositorys.init();

  runApp(MyApp(todoRepositorys));
}

class MyApp extends StatelessWidget {
  MyApp(this.todoRepositorys);
  final TodoRepositorys todoRepositorys;

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [
        EpicMiddleware<AppState>(epics(todoRepositorys)),
      ],
    )..dispatch(const InitTodoAction());

    return StoreProvider<AppState>(
      store: store,
      child: OKToast(
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child: MaterialApp(
          title: 'ToDO List',
          theme: Styles.appThemeData(context),
          debugShowCheckedModeBanner: false,
          builder: (context, child) => child,
          routes: {
            '/': (BuildContext context) => TodoApp(),
            TodoApp.routeName: (BuildContext context) => const About(),
            About.routeName: (BuildContext context) => const About(),
          },
        ),
      ),
    );
  }
}
