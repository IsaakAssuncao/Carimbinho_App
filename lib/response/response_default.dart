import 'package:flutterappstamp/enums/app_enums.dart';

class DefaultResponse<T> {

  final T object;
  final String message;
  final ResponseStatus status;
  final String tipoUsuario;

  bool get success => status == ResponseStatus.rsSuccess;

  bool get failed => status == ResponseStatus.rsFailed;

  DefaultResponse({this.object, this.message, this.status, this.tipoUsuario});

}