import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/designer.dart';
import '../models/gallery.dart';

class DesignerRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userFb = FirebaseAuth.instance.currentUser;
  final uid = FirebaseAuth.instance.currentUser?.uid.toString();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('designers');

  Future<List<DesignerModel>> getEventList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("designers").get();
    return snapshot.docs
        .map((docSnapshot) => DesignerModel.fromSnapshot(docSnapshot))
        .toList();
  }

  Stream<QuerySnapshot<Object?>> getStream() {
    return collection.snapshots();
  }
}
