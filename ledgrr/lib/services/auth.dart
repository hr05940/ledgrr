import 'package:firebase_auth/firebase_auth.dart';
import 'package:ledgrr/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user
  // User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null? User(uid: user.uid) : null;
  // }
  LedgrrUser? _userFromFirebaseUser(User? user) {
    return LedgrrUser(uid: user!.uid);
  }

  //change user stream
  Stream<LedgrrUser?> get user {
    return _auth.authStateChanges()
    .map(_userFromFirebaseUser);
  }

  //sign in with Email & Password

  //register with Email & Password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch(e) {
      print(e.toString());
      return null; 
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}