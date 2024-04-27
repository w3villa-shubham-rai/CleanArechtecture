
import 'package:clean_archtecture/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  final UserSignUpUseCase userSignUpUseCase;
  final LogInUseCase userLogInUseCase;
  AuthBloc({required this.userSignUpUseCase,required this.userLogInUseCase}) : super(AuthIntialState()) {
    on<AuthSignUpEvent>(_handleSignUp);
    on<AuthLoginEvent> (_handleSignIn);
  }

  Future<void> _handleSignUp( AuthSignUpEvent event, Emitter<AuthBlocState> emit,) async {
    try {
      emit(AuthLoadingState());
      final signUpParams = UserSignUpParams(event.email, event.password, event.name);
      final result = await userSignUpUseCase(signUpParams);
      result.fold((failure) => emit(AuthFailureState(failure.message!)), (user) => emit(AuthSuccesState(user)),
      );
    } catch (e) {
      emit(AuthFailureState('An unexpected error occurred'));
    }
  }

  Future<void>_handleSignIn(AuthLoginEvent event, Emitter<AuthBlocState> emit)async{
   try{
    emit(AuthLoadingState());
    final signInParams=UserLoginInParams(email: event.email, password: event.password);
    final result=await userLogInUseCase(signInParams);
    result.fold((failure) => emit(AuthFailureState(failure.message!)), (r) => emit(AuthSuccesState(r)));
   }
   catch(e){
       emit(AuthFailureState('An unexpected error occurred'));
   }
  }
}

