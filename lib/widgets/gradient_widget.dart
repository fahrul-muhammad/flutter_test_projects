import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  final List<Color> colors;
  final Widget child;

  const GradientWidget({
    super.key,
    required this.colors,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: colors,
      ).createShader(bounds),
      child: child,
    );
  }
}
