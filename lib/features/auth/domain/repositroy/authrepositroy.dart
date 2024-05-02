import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/enteties/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepositry {
 Future<Either<Failure, User>> signUpWithEmailPassword({required String name, required String email, required String password});
 Future<Either<Failure, User>> loginUpWithEmailPassword({required String email, required String password});
 Future<Either<Failure,User>> currentUser();
}


