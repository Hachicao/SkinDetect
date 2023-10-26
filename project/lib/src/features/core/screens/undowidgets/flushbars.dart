import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:project/src/features/core/screens/undowidgets/count_down_widget.dart';

class FlushBars {
  static Flushbar undo({
    required String message,
    required VoidCallback onUndo,
    required Duration duration,
  }) {
    return Flushbar<void>(
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: CountDownWidget(duration: duration),
      backgroundColor: Colors.black,
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      mainButton: TextButton(
        onPressed: () {
          onUndo();
        },
        child: const Text(
          'Undo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      isDismissible: true,
    );
  }
}
