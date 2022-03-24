import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User get currentUser;
  Stream<User> onAuthStateChange();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

// this is a wraper class to hide the impelementation
// from the application
class Auth implements AuthBase {
  final _authInstance = FirebaseAuth.instance;
  // return the stream of type user which is async function
  @override
  Stream<User> onAuthStateChange() => _authInstance.authStateChanges();
  // Custom Getter function for currentUser field
  @override
  User get currentUser => _authInstance.currentUser;

  // this function sign in and return the user object
  @override
  Future<User> signInAnonymously() async {
    UserCredential userCredential = await _authInstance.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _authInstance.signOut();
  }
}
