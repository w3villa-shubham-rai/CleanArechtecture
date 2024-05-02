import 'package:clean_archtecture/core/error/exception.dart';
import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:clean_archtecture/core/enteties/user.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepositoryImpl implements AuthRepositry {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

 @override
     Future<Either<Failure, User>> currentUser() async {
     try{
       final user=await remoteDataSource.getCurrentUserData();
       if(user==null){
        return left(Failure('User not logged in !'));
       }
       return right(user);
     }
     on  ApplictionServerException catch(e){
      return left(Failure(e.toString()));
    } 
     }


  @override
  Future<Either<Failure, User>> loginUpWithEmailPassword( {required String email, required String password}) async {
    
      return _getUser(() async=> await remoteDataSource.loginWithEmailPassword(email: email, password: password),); 
  }
   

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    
      debugPrint("email7 :$name");
      debugPrint("email8 :$email");
      debugPrint("email9 :$password");
       return _getUser(() async => await remoteDataSource.signUpWithEmailPassword(
          email: email, password: password, name: name),     
    ) ;
  }


    Future<Either<Failure,User>>_getUser(Future<User> Function() fn)async{
     try {
      final user=await fn();
      return right(user);
    } on sb.AuthException catch(e){
      return left(Failure(e.toString()));
    }
    on ApplictionServerException catch(e){
      return left(Failure(e.toString()));
    }
    
   }
   
    
}
