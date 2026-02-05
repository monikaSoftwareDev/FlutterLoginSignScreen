import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // signup
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Password: $password, confirm password: ");
      return result.user;
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something went wrong';
    }
  }

  // login

  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      print("Login Attempt");
      print("Email: $email");
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Login Success: ${result.user?.uid}");

      return result.user;
    } on FirebaseAuthException catch (e) {
      print("Firebase login Error");
      print("Code: ${e.code}");
      print("Message: ${e.message}");
      throw e.message ?? 'Something went wrong';
    }
  }

  // LOGOUT
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
