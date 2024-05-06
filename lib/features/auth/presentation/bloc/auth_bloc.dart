import 'package:clean_archtecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_archtecture/core/enteties/user.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/current_user_Usecase.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  final UserSignUpUseCase userSignUpUseCase;
  final LogInUseCase userLogInUseCase;
  final CurrentUserUseCase currentUserUseCase;
  final AppUserCubit appUserCubit;
  AuthBloc(
      {required this.userSignUpUseCase,
      required this.userLogInUseCase,
      required this.currentUserUseCase,
      required this.appUserCubit})
      : super(AuthIntialState()) {
    // on<AuthEvent>((_, emait) => emit(AuthLoadingState()));
    on<AuthSignUpEvent>(_handleSignUp);
    on<AuthLoginEvent>(_handleSignIn);
    on<AuthIsUserLoggedInEvent>(_isUserLogedIn);
  }

  Future<void> _handleSignUp(
    AuthSignUpEvent event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      final signUpParams =
          UserSignUpParams(event.email, event.password, event.name);
      final result = await userSignUpUseCase(signUpParams);
      result.fold((failure) => emit(AuthFailureState(failure.message!)),
          (user) => emitAuthSuccess(user, emit)
          //  emit(AuthSuccesState(user)),
          );
    } catch (e) {
      emit(AuthFailureState('An unexpected error occurred'));
    }
  }

  Future<void> _handleSignIn(
      AuthLoginEvent event, Emitter<AuthBlocState> emit) async {
    try {
      emit(AuthLoadingState());
      final signInParams =
          UserLoginInParams(email: event.email, password: event.password);
      final result = await userLogInUseCase(signInParams);
      result.fold((failure) => emit(AuthFailureState(failure.message!)),
          (r) => emitAuthSuccess(r, emit));
      // emit(AuthSuccesState(r)));
    } catch (e) {
      emit(AuthFailureState('An unexpected error occurred'));
    }
  }

  Future<void> _isUserLogedIn(
      AuthIsUserLoggedInEvent event, Emitter<AuthBlocState> emit) async {
    try {
      final res = await currentUserUseCase(NoParams());
      res.fold((failure) => emit(AuthFailureState(failure.message!)), (r) {
        debugPrint("current user email++++ ${r.email}");
        debugPrint("current user id++++++ ${r.id}");
        debugPrint("current user name++++++ ${r.name}");
        // emit(AuthSuccesState(r));
        emitAuthSuccess(r, emit);
      });
    } catch (e) {
      emit(AuthFailureState('An unexpected error occurred _isUserLogedIn'));
    }
  }

  void emitAuthSuccess(User user, Emitter<AuthBlocState> emit) {
    appUserCubit.updateUser(user);
    emit(AuthSuccesState(user));
  }
}
