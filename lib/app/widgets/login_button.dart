import 'package:auth_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const LoginButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: AppConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20)),
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
      ),
    );
  }
}
