import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

class UserSignUpUseCase implements UseCase<String, UserSignUpParams> {
  final AuthRepositry authRepositry;
  UserSignUpUseCase(this.authRepositry);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    debugPrint("email1 :${params.name}");
    debugPrint("email2 :${params.email}");
    debugPrint("email3 :${params.password}");
    return await authRepositry.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams(this.email, this.password, this.name);
}
