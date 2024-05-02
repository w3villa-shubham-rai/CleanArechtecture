class AuthEvent {}

final class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  AuthSignUpEvent(
      {required this.email, required this.password, required this.name});
}

final class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLoginEvent({required this.email,required this.password});
}

final class AuthIsUserLoggedInEvent extends AuthEvent{
  
}