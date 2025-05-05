import 'package:flutter/material.dart';

class GradientHeaderText extends StatelessWidget {
  const GradientHeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFF8B94F7), // Light Purple
          Color(0xFFE77F89), // Pink
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: const Text(
        'Hello, Team',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.white, // This will be replaced by the gradient
        ),
      ),
    );
  }
}