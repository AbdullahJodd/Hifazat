import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/colors.dart';
import '../../widgets/background_wrapper.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool sending = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.85,
      upperBound: 1.1,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> triggerSOS() async {
    if (sending == true) return;

    setState(() => sending = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final String name =
      doc.exists ? (doc.data()?['name'] ?? 'Unknown User') : 'Unknown User';

      await FirebaseFirestore.instance.collection('sos_alerts').add({
        'userId': user.uid,
        'name': name,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'ACTIVE',
        'handled': false,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🚨 SOS alert sent'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send SOS: $e')),
      );
    }

    setState(() => sending = false);
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonChild;

    if (sending) {
      buttonChild = const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      );
    } else {
      buttonChild = const Text(
        'SOS',
        style: TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Scaffold(
      body: BackgroundWrapper(
        child: Center(
          child: ScaleTransition(
            scale: controller,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.sosRed,
                padding: const EdgeInsets.all(80),
                shape: const CircleBorder(),
              ),
              onPressed: sending ? null : triggerSOS,
              child: buttonChild,
            ),
          ),
        ),
      ),
    );
  }
}