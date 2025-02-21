import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double height;
  final double width;
  final double strokeWidth;
  final Color color;

  const CustomCircularProgressIndicator({
    super.key,
    this.height = 40.0,
    this.width = 40.0,
    this.strokeWidth = 4.0,
    this.color = Colors.purple, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
