import 'package:firebase_auth/firebase_auth.dart';
import 'package:mojiji/models/user.dart';
import 'package:mojiji/pages/authenticate/login.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserClass? _userFromCredUser(User? user) {
    return user != null ? UserClass(uid: user.uid) : null;
  }

  Stream<UserClass?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromCredUser(user));
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//signin email password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromCredUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register email password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromCredUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}



 // auth change user stream
  //Firebase User is now User?
  //onAuthStateChanged is now authStateChanges()