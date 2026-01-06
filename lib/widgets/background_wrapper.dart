import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image (BOTTOM PART ONLY)
        Positioned.fill(
          child: Image.asset(
            'assets/images/pic1.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
        ),

        // White overlay (85% opacity)
        Positioned.fill(
          child: Container(
            color: Colors.white.withOpacity(0.3),
          ),
        ),

        // Screen content
        SafeArea(
          child: child,
        ),
      ],
    );
  }
}
