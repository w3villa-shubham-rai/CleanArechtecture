import 'package:clean_archtecture/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({required String name, required String email, required String password});
  Future<String> loginWithEmailPassword({required String email, required String password});
}



// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> loginWithEmailPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({required String name,  required String email, required String password}) async {
   try {
      final responsce = await supabaseClient.auth.signUp(password: password, email: email, data: {name: name});
      if(responsce.user==null){
        throw ApplictionServerException("User is Null !");
      }
      return responsce.user!.id;
   } catch (e) {
     throw ApplictionServerException(e.toString());
   }
  }
}
