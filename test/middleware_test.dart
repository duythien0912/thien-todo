import 'package:flutter_test/flutter_test.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todos/epics/epics.dart';
import 'package:todos/repositorys/repositorys.dart';
import 'package:todos/states/states.dart';

void main() {
  group('State Middleware', () {
    test('call action AddToDoAction', () async {
      final TodoRepositorys repository = TodoRepositorys();
      await repository.init();
      await repository.clear();
      final epicTester = epics(repository);
      expect(epicTester, isA<Epic<AppState>>());
    });
  });
}
