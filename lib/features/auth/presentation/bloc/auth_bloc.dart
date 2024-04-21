import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  final UserSignUpUseCase userSignUpUseCase;
  AuthBloc({required UserSignUpUseCase userSignUp})
      : userSignUpUseCase = userSignUp,
        super(AuthIntialState()) {
    on<AuthSignUp>(userSignUpU);
  }

  Future userSignUpU(AuthSignUp event, Emitter<AuthBlocState> emitter) async {
    final res = await userSignUpUseCase(UserSignUpParams(event.email, event.password, event.name));

    res.fold((failure) => emitter(AuthFailureState(failure.message!)),
        (uId) => emitter(AuthSuccesState(uId)));
  }
}
