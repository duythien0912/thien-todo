import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todos/actions/action.dart';
import 'package:todos/epics/epics.dart';
import 'package:todos/page/all.dart';
import 'package:todos/reducers/reducers.dart';
import 'package:todos/repositorys/repositorys.dart';
import 'package:todos/states/states.dart';

void main() {
  group('State reducer', () {
    test('should update BottomAppTab', () {
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState.initialState(),
        middleware: [
          EpicMiddleware<AppState>(epics(TodoRepositorys())),
        ],
      )..dispatch(PageChangedAction(AllScreen.routeName));
      expect(store.state.bottomSelectPage, AllScreen.routeName);
    });
  });
}
