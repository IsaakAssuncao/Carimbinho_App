import 'package:flutterappstamp/response/response_default.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> doLoginGoogle();

  Future<DefaultResponse> doLoginEmailPassword({String email, String password});

  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});

  Future<DefaultResponse> getUser();

  Future<DefaultResponse> logOut();
}
