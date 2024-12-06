import 'package:flutter/material.dart';

class CircularDecorator extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final List<Color>? gradientColors;

  const CircularDecorator({
    Key? key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.size = 300,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5000),
          gradient: LinearGradient(
            colors: gradientColors ??
                [
                  Color.fromARGB(62, 255, 255, 255),
                  Color.fromARGB(0, 255, 255, 255)
                ],
          ),
        ),
      ),
    );
  }
}
