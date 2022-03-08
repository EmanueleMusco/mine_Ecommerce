import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mojiji/models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserClasses? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserClasses(user.uid, user.email);
  }

  Stream<UserClasses?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserClasses?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _userFromFirebase(credential.user);
  }

  Future<UserClasses?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

 // auth change user stream
  //Firebase User is now User?
  //onAuthStateChanged is now authStateChanges()