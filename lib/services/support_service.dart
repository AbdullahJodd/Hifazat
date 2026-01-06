import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SupportService {
  final _db = FirebaseFirestore.instance;

  Future<void> sendMessage(String message) async {
    final user = FirebaseAuth.instance.currentUser;

    await _db.collection('support_messages').add({
      'userId': user?.uid,
      'message': message,
      'reply': '',
      'timestamp': Timestamp.now(),
    });
  }
}
