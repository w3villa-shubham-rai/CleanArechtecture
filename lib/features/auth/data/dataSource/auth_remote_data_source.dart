import 'package:clean_archtecture/core/error/exception.dart';
import 'package:clean_archtecture/features/auth/data/models/user.models.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword( {required String name, required String email, required String password});
  Future<UserModel> loginWithEmailPassword( {required String email, required String password});
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<UserModel> loginWithEmailPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      debugPrint("email4 :$name");
      debugPrint("email5 :$email");
      debugPrint("email6 :$password");
      final responsce = await supabaseClient.auth.signUp(password: password, email: email,data: {'name':name});
      if (responsce.user == null) {
        throw ApplictionServerException("User is Null !");
      }
      return UserModel.fromJson(responsce.user!.toJson());
    } catch (e) {
      debugPrint("Error in signUpWithEmailPassword: $e");
      throw ApplictionServerException(e.toString());
    }
  }
}
