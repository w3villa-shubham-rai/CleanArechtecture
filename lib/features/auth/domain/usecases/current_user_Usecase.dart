import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/auth/domain/enteties/user.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:fpdart/src/either.dart';

class CurrentUserUseCase implements UseCase<User, NoParams> {
  final AuthRepositry authRepositry;
  CurrentUserUseCase(this.authRepositry);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepositry.currentUser();

  }
}
