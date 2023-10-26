import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget {
  final Duration duration;
  const CountDownWidget({Key? key, required this.duration});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  String get counterText {
    final Duration count = controller.duration! * controller.value;
    return count.inSeconds.toString();
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
    controller.reverse(from: 1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: controller.value,
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
            Text(
              counterText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
