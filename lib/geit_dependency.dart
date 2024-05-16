import 'package:clean_archtecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_archtecture/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:clean_archtecture/features/auth/data/repositories/auth_repositorie_impl.dart';
import 'package:clean_archtecture/features/auth/domain/repositroy/authrepositroy.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/current_user_Usecase.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/blog/data/dataSource/blog_remote_data_source.dart';
import 'package:clean_archtecture/features/blog/data/repositories/blog_repositry_impl.dart';
import 'package:clean_archtecture/features/blog/domain/repository/blog_repository.dart';
import 'package:clean_archtecture/features/blog/domain/usecases/fetchblog_usecase.dart';
import 'package:clean_archtecture/features/blog/domain/usecases/uploadBlog_usecase.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/secrets/app_secrets_url.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {
  final supabase = await Supabase.initialize(
      url: AppSecretsUrl.supabaseUrl, anonKey: AppSecretsUrl.secretsanonKey);
      serviceLocator.registerLazySingleton(() => supabase.client);  
     _initauth();
     _initBlog();
}

void _initauth(){

  serviceLocator.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(serviceLocator(),),);
  serviceLocator.registerFactory<AuthRepositry>(() => AuthRepositoryImpl(serviceLocator(),),);
  serviceLocator.registerFactory<UserSignUpUseCase>(() => UserSignUpUseCase(serviceLocator(),),);
  serviceLocator.registerFactory(() => LogInUseCase(serviceLocator(),),);
  serviceLocator.registerFactory(() => CurrentUserUseCase(serviceLocator(),),);
  serviceLocator.registerLazySingleton(() => AppUserCubit());
  serviceLocator.registerLazySingleton(() => AuthBloc(userSignUpUseCase: serviceLocator<UserSignUpUseCase>(),userLogInUseCase: serviceLocator(), currentUserUseCase: serviceLocator(), appUserCubit: serviceLocator()),);

}


void _initBlog(){
  // Datasource
  serviceLocator.registerFactory<BlogRemoteDataSource>(() => BlogRemoteDataSourceImpl(serviceLocator(),));
  // Repositry
  serviceLocator.registerFactory<BlogRepository>(() => BlogReposryImp(serviceLocator(),));
  // Usecase
  serviceLocator.registerFactory<UploadBlogUseCase>(() => UploadBlogUseCase(serviceLocator()));
  // Usecae
  serviceLocator.registerFactory<FethchAllBlogsUseCase>(() => FethchAllBlogsUseCase(serviceLocator()));
  // Bloc
  serviceLocator.registerLazySingleton(() => BlogBloc(serviceLocator<UploadBlogUseCase>(),serviceLocator<FethchAllBlogsUseCase>()));
}
