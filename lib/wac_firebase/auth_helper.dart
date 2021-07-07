import 'package:firebase_auth/firebase_auth.dart';

class AuthHelpers {
  AuthHelpers._();
  static AuthHelpers authHelpers = AuthHelpers._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  register(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user.uid);
      return userCredential.user;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user.emailVerified);
      return userCredential.user;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  checkUser() {
    print(firebaseAuth.currentUser.emailVerified);
  }

  logout() async {
    firebaseAuth.signOut();
  }

  forgetPassword(String email) async {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  resetPassword(String password) async {
    firebaseAuth.currentUser.updatePassword(password);
  }

  sendVeriificationCode() async {
    firebaseAuth.currentUser.sendEmailVerification();
  }
}
