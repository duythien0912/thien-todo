import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todos/page/about.dart';
import 'package:todos/widgets/todoModal.dart';

import '../styles.dart';

class Header extends StatelessWidget {
  void _goToDetail(String title, context) {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const TodoModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Styles.BoxW16,
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.of(context).pushNamed(About.routeName);
          },
          child: Row(
            children: [
              Text(
                'ToDO List',
                style: Styles.headline(context),
              ),
              Styles.BoxW8,
              Align(
                child: Icon(
                  Icons.info,
                  color: Styles.headline(context).color.withOpacity(0.3),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _goToDetail('Add task', context);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Styles.primaryColor(context),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
        Styles.BoxW16,
      ],
    );
  }
}
