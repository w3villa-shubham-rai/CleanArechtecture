
import 'package:clean_archtecture/core/enteties/user.dart';

class AuthBlocState {}

final class AuthIntialState extends AuthBlocState {}

final class AuthLoadingState extends AuthBlocState {
  
}

final class AuthSuccesState extends AuthBlocState {
  final User user;
  AuthSuccesState(this.user);
}

final class AuthFailureState extends AuthBlocState {
  final String message;
  AuthFailureState(this.message);
}
