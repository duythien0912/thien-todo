import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/selectors/selectors.dart';
import 'package:todos/widgets/toast.dart';

import '../models/todo.dart';
import '../states/states.dart';
import '../styles.dart';

class TodoModal extends StatefulWidget {
  const TodoModal({this.todo});
  final ToDoData todo;

  @override
  _TodoModalState createState() => _TodoModalState();
}

class _TodoModalState extends State<TodoModal> {
  TextEditingController titleController = TextEditingController();
  bool isCreate = true;

  @override
  void initState() {
    if (widget.todo != null && widget.todo.key != null) isCreate = false;
    if (!isCreate) titleController.text = widget.todo.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: const Duration(milliseconds: 250),
      child: Material(
        child: SafeArea(
          top: false,
          child: Padding(
            padding: Styles.paddingW16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Styles.BoxH16,
                Row(
                  children: [
                    Text(
                      isCreate ? 'Add your ToDO task' : 'Edit ToDO task',
                      style: Styles.headline5(context).copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.of(context).maybePop();
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                Styles.BoxH16,
                Container(
                  child: StoreConnector<AppState, ToDoSelector>(
                    converter: (Store<AppState> store) => ToDoSelector.create(store),
                    builder: (context, ToDoSelector state) => TextFormField(
                      maxLines: 3,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      controller: titleController,
                      style: textStyle,
                      onSaved: (String value) {
                        if (isCreate) {
                          state.onAdd(titleController.text);
                        } else {
                          state.onEdit(widget.todo, titleController.text);
                        }
                        Toast.showTop('Success');
                        Navigator.of(context).pop();
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: Styles.paddingAll12,
                        labelStyle: textStyle,
                        fillColor: Colors.black,
                        hintText: 'Eg: I will learn Redux today',
                      ),
                      autofocus: true,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: textStyle.color.withOpacity(0.08),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                Styles.BoxH16,
                SizedBox(
                  width: double.infinity,
                  child: StoreConnector<AppState, ToDoSelector>(
                    converter: (Store<AppState> store) => ToDoSelector.create(store),
                    builder: (context, ToDoSelector state) => FlatButton(
                      color: Styles.primaryColor(context),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onPressed: () {
                        if (isCreate) {
                          state.onAdd(titleController.text);
                        } else {
                          state.onEdit(widget.todo, titleController.text);
                        }
                        // Toast.showTop('Success');
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Styles.BoxH16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
