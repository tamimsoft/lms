import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();
  static void success({required BuildContext context, String? title, required String message}) {
    Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.BOTTOM,
      // Position the Flushbar at the top
      animationDuration: const Duration(milliseconds: 300),
    ).show(context);
  }

  static void alert({required BuildContext context, String? title, required String message}) {
    Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.grey,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.BOTTOM,
      // Position the Flushbar at the top
      animationDuration: const Duration(milliseconds: 300),
    ).show(context);
  }

  static void error({required BuildContext context, String? title, required String message}) {
    Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.BOTTOM,
      // Position the Flushbar at the top
      animationDuration: const Duration(milliseconds: 300),
    ).show(context);
  }
}
