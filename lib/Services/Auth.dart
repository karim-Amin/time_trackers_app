import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User get currentUser;
  Stream<User> onAuthStateChange();
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
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
  Future<User> signInWithGoogle() async {
    // this function trigger sign in with google event
    final googleSignIn = GoogleSignIn();
    // let the user enter his google account
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      // get the access Token
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        // firebase to get the user credintials
        final userCredential = await _authInstance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return userCredential.user;
      } else {
        /* Handle the Error */
        throw FirebaseAuthException(
            code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user ');
      }
    } else {
      /* Handle the Error */
      throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user ');
    }
  }

  @override
  Future<void> signOut() async {
    // invalidate the access Token for Google
    final googleSignIn = GoogleSignIn();
    // it returns Future<GoogleSignInAccount>
    // to invalidate the google access Token
    // so in the next sign in you will be asked
    // to choose google account
    await googleSignIn.signOut();
    await _authInstance.signOut();
  }
}
