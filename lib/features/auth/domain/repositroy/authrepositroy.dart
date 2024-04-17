import 'package:clean_archtecture/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepositry {
 Future<Either<Failure, String>> signUpWithEmailPassword({required String name, required String email, required String password});
 Future<Either<Failure, String>> loginUpWithEmailPassword({required String email, required String password});
}


