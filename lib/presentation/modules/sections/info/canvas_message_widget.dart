import 'package:flutter/material.dart';

class CanvasMessageWidget extends StatefulWidget {
  const CanvasMessageWidget({super.key});

  @override
  State<CanvasMessageWidget> createState() => _CanvasMessageWidgetState();
}

class _CanvasMessageWidgetState extends State<CanvasMessageWidget> {
  bool cubetsSurprised = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          cubetsSurprised = !cubetsSurprised;
        });
      },
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange,
                gradient: const LinearGradient(
                  colors: [
                    Colors.deepOrange,
                    Colors.orange,
                  ],
                ),
              ),
              child: Image.asset(
                cubetsSurprised
                    ? 'icons/cubets_face.png'
                    : 'icons/cubets_face_2.png',
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
              ),
            ),
            const ShakeWidget(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Thinking outside\nthe box while still\nworrying about what's inside",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    super.key,
    this.duration = const Duration(milliseconds: 700),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.child,
  });

  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(widget.deltaX * shake(controller.value), 0),
        child: child,
      ),
      child: widget.child,
    );
  }
}
