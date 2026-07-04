import 'package:flutter/material.dart';

/// Shows a consistently styled floating snackbar, replacing any snackbar
/// currently on screen so messages never queue up and linger.
void showAppSnackBar(
  BuildContext context,
  String message, {
  Color backgroundColor = Colors.green,
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
}
