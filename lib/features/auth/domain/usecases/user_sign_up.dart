import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepositry authRepositry;
  UserSignUp(this.authRepositry);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async{
   return await authRepositry.signUpWithEmailPassword(name: params.name, email: params.email, password:params.password);
   
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams(this.email, this.password, this.name);
}
