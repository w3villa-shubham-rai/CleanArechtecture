import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/auth/domain/enteties/user.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:fpdart/src/either.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class UserSignUpUseCase implements UseCase<User, UserSignUpParams> {
  final AuthRepositry authRepositry;
  UserSignUpUseCase(this.authRepositry);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepositry.signUpWithEmailPassword(name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams(this.email, this.password, this.name);
}
//  final res = await userSignUpUseCase(UserSignUpParams(event.email, event.password, event.name),);