import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  final UserSignUp userSignUp;
  AuthBloc({required UserSignUp userSignUp}): userSignUp =userSignUp, super(AuthIntialState()) {
    on<AuthSignUp>((event, emit) async{
     final res= await userSignUp(UserSignUpParams(event.email, event.password, event.name));
     res.fold((failure) => emit(AuthFailureState(failure.message!)), (uId) => emit(AuthSuccesState(uId)));
    });
  }
}
