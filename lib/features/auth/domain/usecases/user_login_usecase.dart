import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/core/enteties/user.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:fpdart/src/either.dart';

class LogInUseCase implements UseCase<User,UserLoginInParams>{
   final AuthRepositry authRepositry;
   LogInUseCase(this.authRepositry);
  @override
  Future<Either<Failure, User>> call(UserLoginInParams params)async {
       return await authRepositry.loginUpWithEmailPassword(email: params.email, password: params.password);
  }

}

class UserLoginInParams{
 final String email;
 final String password;
 UserLoginInParams({required this.email, required this.password});
}