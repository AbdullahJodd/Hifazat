import 'package:flutter/material.dart';
import '../../app.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate immediately after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HifazatApp()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 1.5, // 🔑 controls logo size (adjust if needed)
          child: Image.asset(
            'assets/images/hifazat.jpg',
            fit: BoxFit.contain, // keeps full image visible
          ),
        ),
      ),
    );
  }
}