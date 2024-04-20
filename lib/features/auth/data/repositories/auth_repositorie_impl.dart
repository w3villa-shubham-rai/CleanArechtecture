import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:flutter/material.dart';
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
       debugPrint("email7 :$name");
       debugPrint("email8 :$email");
       debugPrint("email9 :$password");
       final userId = await remoteDataSource.signUpWithEmailPassword( email: email, password: password, name: name);
       debugPrint("email9 :$password");
       return right(userId);
    }  catch (e) {
        debugPrint("error in auth repo :$e");
       Failure failure = Failure(e.toString());
      return left(failure);
    }
  }
}
