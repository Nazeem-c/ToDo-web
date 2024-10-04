// main_content.dart
import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  final Widget content;

  const MainContent({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: content,
      ),
    );
  }
}
