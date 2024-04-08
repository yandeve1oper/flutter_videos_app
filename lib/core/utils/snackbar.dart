import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

enum SnackBarMessageType { error, info }

class CustomSnackBar {
  CustomSnackBar._();

  static void show(
    String title, {
    SnackBarMessageType type = SnackBarMessageType.info,
    BuildContext? context,
    Duration duration = const Duration(milliseconds: 2500),
  }) {
    final currentState = context != null
        ? ScaffoldMessenger.of(context)
        : scaffoldMessengerKey.currentState;

    if (currentState == null) return;

    Color backgroundColor;

    switch (type) {
      case SnackBarMessageType.error:
        backgroundColor = Colors.red;
        break;
      case SnackBarMessageType.info:
        backgroundColor = Colors.blue;
        break;
    }

    final snackBar = SnackBar(
      duration: duration,
      content: Text(title),
      padding: const EdgeInsets.all(16),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
    );

    currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void hideCurrent({BuildContext? context}) {
    ScaffoldMessengerState? currentState = context != null
        ? ScaffoldMessenger.of(context)
        : scaffoldMessengerKey.currentState;

    currentState?.hideCurrentSnackBar();
  }
}
