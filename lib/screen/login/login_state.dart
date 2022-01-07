part of 'login_controller.dart';



@immutable
class LoginControllerState {
  final Exception? exception;
  final RequestStatus requestStatus;

  const LoginControllerState(this.requestStatus, this.exception);
}

class LoginState extends LoginControllerState {
  final LoginResponseModel? response;

  const LoginState(
      RequestStatus requestStatus, {
        this.response,
        Exception? exception,
      }) : super(requestStatus, exception);
}
