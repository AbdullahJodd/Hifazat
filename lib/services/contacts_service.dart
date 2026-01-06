import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getContacts() {
    return _firestore.collection('contacts').snapshots();
  }
}
