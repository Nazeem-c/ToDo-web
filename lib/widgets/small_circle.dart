import 'package:flutter/material.dart';
import '../../colors.dart'; // Update the path according to your project structure

class SmallCircle extends StatelessWidget {
  final Color color; // Color of the circle
  final double size; // Size of the circle

  const SmallCircle({
    Key? key,
    this.color = AppColors.primary, // Default color
    this.size = 3.0, // Default size (3 pixels)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, // Set the width for the circle
      height: size, // Set the height for the circle
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Make the shape circular
        color: color, // Set the color of the circle
      ),
    );
  }
}
