import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterappstamp/interfaces/auth_respository_interface.dart';
import 'package:flutterappstamp/response/response_builder.dart';
import 'package:flutterappstamp/response/response_default.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> doLoginGoogle() async {
    try {
      var googleSignIn = GoogleSignIn();
      var googleSignInAccount = await googleSignIn.signIn();
      var googleSignInAuthentication = await googleSignInAccount.authentication;

      FirebaseUser firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        var credential = GoogleAuthProvider.getCredential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth.signInWithCredential(credential).then((onValue) {
          firebaseUser = onValue.user;
        });
      }
      return ResponseBuilder.success<FirebaseUser>(
          object: firebaseUser, message: 'usuário logado com sucesso');
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: 'falha ao realizar login com Google. e: ${e.toString()}');
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((onValue) {
        return ResponseBuilder.success<FirebaseUser>(object: onValue.user);
      });
    } on Exception catch (e) {
      print(e.toString());
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
}
