import 'package:flutter/material.dart';

class MainAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? buttonHeight;
  const MainAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(
          buttonHeight ?? 80,
        ),
      ),
      child: Text(title),
    );
  }
}
