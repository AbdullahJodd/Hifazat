import 'package:cloud_firestore/cloud_firestore.dart';

class LawsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getLaws() {
    return _firestore.collection('laws').snapshots();
  }
}
