
import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  final UserSignUpUseCase userSignUpUseCase;

  AuthBloc({required this.userSignUpUseCase}) : super(AuthIntialState()) {
    on<AuthSignUpEvent>(_handleSignUp);
    
  }



  Future<void> _handleSignUp( AuthSignUpEvent event, Emitter<AuthBlocState> emit,) async {
    try {
      emit(AuthLoadingState());
      final signUpParams = UserSignUpParams( event.email, event.password, event.name, );
      final result = await userSignUpUseCase(signUpParams);
      result.fold((failure) => emit(AuthFailureState(failure.message!)), (user) => emit(AuthSuccesState(user)),
      );
    } catch (e) {
      emit(AuthFailureState('An unexpected error occurred'));
    }finally{

    }
  }
}

