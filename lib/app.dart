import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todos/page/complete.dart';
import 'package:todos/page/incomplete.dart';
import 'package:todos/selectors/selectors.dart';
import 'package:todos/states/states.dart';
import 'package:todos/widgets/doubleTapBackExitApp.dart';
import 'package:redux/redux.dart';

import 'page/all.dart';
import 'styles.dart';
import 'widgets/header.dart';

class TodoApp extends StatefulWidget {
  static String routeName = '${TodoApp().runtimeType}';

  @override
  State<StatefulWidget> createState() {
    return TodoAppState();
  }
}

class TodoAppState extends State<TodoApp> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final List<Widget> homeViews = [
    const AllScreen(),
    const CompleteScreen(),
    const IncompleteScreen(),
  ];
  List<String> homeViewsType = [];

  @override
  void initState() {
    homeViewsType = homeViews.map((Widget e) => '${e.runtimeType}').toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleTapBackExitApp(
      child: StoreConnector<AppState, BottomNavigationSelector>(
        converter: (Store<AppState> store) =>
            BottomNavigationSelector.create(store),
        distinct: true,
        builder: (context, BottomNavigationSelector state) => Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Styles.BoxH24,
                  Header(),
                  Styles.BoxH8,
                  Padding(
                    padding: Styles.paddingW16,
                    child: Container(
                        color: Styles.todoTextStyle(context)
                            .color
                            .withOpacity(0.1),
                        height: 1),
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        final String indexName =
                            '${homeViews[index].runtimeType}';
                        if (state.bottomSelectIndex != indexName)
                          state.onChangedPage(indexName);
                      },
                      children: homeViews,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeViewsType.indexOf(state.bottomSelectIndex),
              onTap: (index) {
                final String indexName = '${homeViews[index].runtimeType}';
                if (state.bottomSelectIndex != indexName)
                  state.onChangedPage(indexName);
                pageController.jumpToPage(index);
              },
              items: buildBottomNavBarItems(),
            )),
      ),
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'All'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.check_circle), label: 'Complete'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outlined), label: 'Incomplete'),
    ];
  }
}
