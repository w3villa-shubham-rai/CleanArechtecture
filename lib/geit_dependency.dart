import 'package:clean_archtecture/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:clean_archtecture/features/auth/data/repositories/auth_repositorie_impl.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/secrets/app_secrets_url.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {
  final supabase = await Supabase.initialize(
      url: AppSecretsUrl.supabaseUrl, anonKey: AppSecretsUrl.secretsanonKey);
      serviceLocator.registerLazySingleton(() => supabase.client);  
     _initauth();
}

void _initauth(){

  serviceLocator.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(serviceLocator(),),);

  serviceLocator.registerFactory<AuthRepositry>(() => AuthRepositoryImpl(serviceLocator(),),);

  serviceLocator.registerFactory<UserSignUpUseCase>(() => UserSignUpUseCase(serviceLocator(),),);
  
  serviceLocator.registerLazySingleton(() => AuthBloc(userSignUpUseCase: serviceLocator<UserSignUpUseCase>()));

}
