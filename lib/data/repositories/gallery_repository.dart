import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/gallery.dart';

class GalleryRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userFb = FirebaseAuth.instance.currentUser;
  final uid = FirebaseAuth.instance.currentUser?.uid.toString();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('galleries');

  Future<List<GalleryModel>> getEventList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("galleries").get();
    return snapshot.docs
        .map((docSnapshot) => GalleryModel.fromSnapshot(docSnapshot))
        .toList();
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Stream<QuerySnapshot<Object?>> getStream() {
    return collection.snapshots();
  }
}
