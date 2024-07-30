import 'package:flutter/material.dart';

class MainAppButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final double? buttonHeight;
  const MainAppButtonWidget(
      {super.key,
      required this.buttonText,
      required this.onButtonPressed,
      this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(buttonHeight ?? 80),
      ),
      child: Text(
        buttonText,
      ),
    );
  }
}
