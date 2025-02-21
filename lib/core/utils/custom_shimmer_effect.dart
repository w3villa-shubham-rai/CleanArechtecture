import 'package:flutter/material.dart';

class CustomShimmer extends StatefulWidget {
  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final BorderRadius? borderRadius;

  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
    this.borderRadius,
  });

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _shimmerAnimation = Tween<Alignment>(
      begin: const Alignment(-1.5, 0.0),
      end: const Alignment(1.5, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: _shimmerAnimation.value,
              end: const Alignment(1.5, 0.0),
              colors: [widget.baseColor, widget.highlightColor, widget.baseColor],
              stops: const [0.2, 0.5, 0.8],
            ).createShader(bounds);
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.baseColor,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            ),
          ),
          blendMode: BlendMode.srcATop,
        );
      },
    );
  }
}
