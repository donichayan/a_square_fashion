import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> forgotPassword({required String email}) async {
    late bool _status;
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) => _status = true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw Exception('The email provided is invalid.');
      } else if (e.code == 'user-not-found') {
        throw Exception('The account does not exists for that email.');
      }
      _status = false;
    }
    return _status;
  }

  Future<void> refreshUser() async {
    try {
      FirebaseAuth.instance.currentUser!.refreshToken;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw Exception('The email provided is invalid.');
      } else if (e.code == 'user-not-found') {
        throw Exception('The account does not exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
