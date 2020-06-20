import 'package:flutterappstamp/response/response_default.dart';

abstract class IAuthRespository {
  Future<DefaultResponse> doLoginGoogle();
}