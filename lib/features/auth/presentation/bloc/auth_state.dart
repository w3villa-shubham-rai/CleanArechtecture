import 'package:clean_archtecture/features/auth/data/models/user.models.dart';
import 'package:clean_archtecture/features/auth/domain/enteties/user.dart';

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
