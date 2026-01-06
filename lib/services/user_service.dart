import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get uid => _auth.currentUser!.uid;

  Future<bool> isProfileCompleted() async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return false;
    return doc.data()?['profileCompleted'] == true;
  }

  Future<void> saveProfile({
    required String name,
    required int age,
    required String gender,
    required String city,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'age': age,
      'gender': gender,
      'city': city,
      'email': _auth.currentUser!.email,
      'profileCompleted': true,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> getProfile() async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.data();
  }
}
