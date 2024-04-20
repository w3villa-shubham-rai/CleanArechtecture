class AuthBlocState {}

final class AuthIntialState extends AuthBlocState {}

final class AuthLoadingState extends AuthBlocState {}

final class AuthSuccesState extends AuthBlocState {
  final String uId;
  AuthSuccesState(this.uId);
}

final class AuthFailureState extends AuthBlocState {
  final String message;
  AuthFailureState(this.message);
}
