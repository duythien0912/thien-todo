import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class Toast {
  static void show(String msg, {int duration = 2000}) {
    if (msg == null) {
      return;
    }
    showToast(
      msg,
      duration: Duration(milliseconds: duration),
      dismissOtherToast: true,
    );
  }

  static void showTop(String msg, {int duration = 2000}) {
    if (msg == null) {
      return;
    }
    showToast(
      msg,
      duration: Duration(milliseconds: duration),
      dismissOtherToast: true,
      position: ToastPosition.top,
      backgroundColor: const Color(0xFF36CC1C).withOpacity(0.9),
    );
  }

  static void cancelToast() {
    dismissAllToast();
  }
}
