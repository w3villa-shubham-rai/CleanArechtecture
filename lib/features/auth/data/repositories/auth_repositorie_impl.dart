import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:fpdart/fpdart.dart';


class AuthRepositoryImpl implements AuthRepositry {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginUpWithEmailPassword({required String email, required String password}) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword( {required String name,required String email,required String password}) async {
    try {
      final userId = await remoteDataSource.loginWithEmailPassword( email: email, password: password);
       return right(userId);
    }  catch (e) {
       Failure failure = Failure(e.toString());
      return left(failure);
    }
  }
}
