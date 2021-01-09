import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:redux/redux.dart';
import 'package:todos/page/all.dart';
import 'package:todos/page/complete.dart';
import 'package:todos/page/incomplete.dart';
import 'package:todos/selectors/selectors.dart';
import 'package:todos/widgets/todoModal.dart';

import '../models/todo.dart';
import '../states/states.dart';
import '../styles.dart';
import '../widgets/customCheckBox.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({Key key, this.routeName}) : super(key: key);

  final String routeName;

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo>
    with AutomaticKeepAliveClientMixin<ListTodo> {
  @override
  bool get wantKeepAlive => true;

  void _goToEdit(BuildContext context, ToDoData value) {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => TodoModal(todo: value),
    );
  }

  void _goToDetail(BuildContext context) {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const TodoModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const String assetName = 'assets/unicorn.svg';
    final Widget svgIcon = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Empty todo list',
    );

    return StoreConnector<AppState, ToDoSelector>(
      key: widget.key,
      converter: (Store<AppState> store) => ToDoSelector.create(store),
      distinct: true,
      builder: (BuildContext context, ToDoSelector todoModle) {
        List<ToDoData> todos = [];
        if (widget.routeName == AllScreen.routeName) {
          todos = todoModle.todoData;
        }
        if (widget.routeName == CompleteScreen.routeName) {
          todos = todoModle.todoDataComplete;
        }
        if (widget.routeName == IncompleteScreen.routeName) {
          todos = todoModle.todoDataInComplete;
        }

        if (todoModle.todoData.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: svgIcon,
                height: MediaQuery.of(context).size.width / 3,
              ),
              Styles.BoxH12,
              Text(
                'Add your first ToDO',
                style: Styles.headline5(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Styles.BoxH8,
              FlatButton(
                color: Styles.primaryColor(context),
                child: const Text(
                  'Add Now',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () {
                  _goToDetail(context);
                },
              ),
            ],
          );
        }

        return ListView.builder(
          physics: Styles.iosScroll,
          padding: Styles.paddingH4,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int postion) {
            final ToDoData value = todos[postion];

            return GestureDetector(
              onTap: () {
                _goToEdit(context, value);
              },
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: [
                  Styles.BoxH8,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Styles.BoxW16,
                      RadiusCheckBox(
                        key: ValueKey(value.key),
                        value: value.complete ?? false,
                        activeColor: Styles.primaryColor(context),
                        onChanged: (bool val) {
                          todoModle.onUpdate(value, val);
                        },
                      ),
                      Styles.BoxW8,
                      Expanded(
                        child: Text(
                          '${value.title}',
                          style: Styles.todoTextStyle(
                            context,
                          ).copyWith(
                              decoration: value.complete ?? false
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          todoModle.onRemove(value);
                        },
                      ),
                      Styles.BoxW12,
                    ],
                  ),
                  Styles.BoxH8,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
