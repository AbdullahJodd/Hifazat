import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SosService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> triggerSOS(String name) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }

    await _firestore.collection('sos_alerts').add({
      'userId': user.uid,
      'name': name,
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'ACTIVE',
      'handled': false,
    });
  }
}
