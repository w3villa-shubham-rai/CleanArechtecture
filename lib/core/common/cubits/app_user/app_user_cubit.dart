import 'package:clean_archtecture/core/common/cubits/app_user/app_user_state.dart';
import 'package:clean_archtecture/core/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserState());
  void updateUser(User? user) {
    if (user == null) {
      emit(AppUserInitial());
    }
    else{
      emit(AppUserLoggedIn(user));
    }
  }
}
