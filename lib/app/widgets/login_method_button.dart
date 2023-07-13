// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LoginMethodButton extends StatefulWidget {
  final String asset;
  final double width;
  const LoginMethodButton({
    Key? key,
    required this.asset,
    required this.width,
  }) : super(key: key);

  @override
  _LoginMethodButtonState createState() => _LoginMethodButtonState();
}

class _LoginMethodButtonState extends State<LoginMethodButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: TextButton(
            onPressed: () {},
            // onTapDown: (_) => _animationController.forward(),
            // onTapCancel: () => _animationController.reverse(),
            // onTapUp: (_) => _animationController.reverse(),
            child: Image.asset(
              widget.asset,
              height: 50,
              width: widget.width,
            ),
          ),
        );
      },
    );
  }
}
