import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'How can I help you today?',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Color(0xFFD7D7D7),
      ),
    );
  }
}