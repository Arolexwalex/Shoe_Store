import 'package:firebase_auth/firebase_auth.dart';


class Authentication {
  final FirebaseAuth _firebaseAuth =
  FirebaseAuth.instance;

  Future<UserCredential>
  signInWithEmailAndPassword(
    String email, String password) async {
      return await 
      _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    }

    Future<UserCredential> 
    createUserWithEmailAndPassword(
      String email, String password
    ) async {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    }

    Future<void> signOut() async {
      await _firebaseAuth.signOut();
    }

    Stream<User?> get authStateChanges =>
    _firebaseAuth.authStateChanges();


}