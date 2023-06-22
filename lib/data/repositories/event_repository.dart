import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vie_fashion_week/data/models/event.dart';
import 'package:vie_fashion_week/data/models/initil_user.dart';
import 'package:vie_fashion_week/data/models/user.dart';

class EventsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userFb = FirebaseAuth.instance.currentUser;
  final uid = FirebaseAuth.instance.currentUser?.uid.toString();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('events');

  Future<List<Events>> getEventList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("events").get();
    return snapshot.docs
        .map((docSnapshot) => Events.fromSnapshot(docSnapshot))
        .toList();
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

//Firestore. instance. collection('COLLECTION_NAME'). document('TESTID1')
  Future<UserFA> getUserEventList() async {
    // ignore: avoid_print
    //print(uid);
    final snapshot = await _db.collection("profile").doc(uid).get();
    if (snapshot.data() != null) {
      var isNullCheck = snapshot.data()!.containsKey('events');
      if (isNullCheck) {
        final userFA = UserFA.fromSnapshot(snapshot);
        // ignore: avoid_print
        //print(userFA);
        return userFA;
      } else {
        return _manageEmptyEvent();
      }
    } else {
      return _manageEmptyEvent();
    }
  }

  Future<UserFA> _manageEmptyEvent() async {
    UserFA newUser = UserFA(
        user: userFb?.email ?? 'email not available',
        firstName: '',
        lastName: '',
        events: []);

    await _db.collection("profile").doc(uid).set(
        InitialUserFA(user: userFb?.email ?? "no email available").toJson());
    return newUser;
  }

  Future<UserFA> getUser() async {
    // ignore: avoid_print
    //print(uid);
    final snapshot = await _db.collection("profile").doc(uid).get();

    if (snapshot.data() != null) {
      var isNullCheck = snapshot.data()!.containsKey('events');
      if (isNullCheck) {
        final userFA = UserFA.fromSnapshot(snapshot);
        // ignore: avoid_print
        //print(userFA);
        return userFA;
      } else {
        return _manageEmptyEvent();
      }
    } else {
      return _manageEmptyEvent();
    }

    // ignore: avoid_print
    //print(userFA);
  }

  void updateUser(UserFA user) async {
    //user = userFb.email;
    await _db.collection("profile").doc(uid).update(user.toJson());
  }

  Stream<QuerySnapshot<Object?>> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addEvent(Events event) {
    return collection.add(event.toJson());
  }
}
