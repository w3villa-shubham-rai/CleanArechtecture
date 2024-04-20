class AuthEvent {
  
}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;
  AuthSignUp({required this.email, required this.password, required this.name});
}
