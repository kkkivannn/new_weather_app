import 'package:firebase_auth/firebase_auth.dart';

class AuthorizationFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanged => _firebaseAuth.authStateChanges();
  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }
}
