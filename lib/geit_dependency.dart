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
import 'package:clean_archtecture/features/blog/domain/usecases/uploadBlog_usecase.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/secrets/app_secrets_url.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {

  final supabase = await Supabase.initialize(url: AppSecretsUrl.supabaseUrl, anonKey: AppSecretsUrl.secretsanonKey);
  serviceLocator.registerSingleton(supabase.client);

  // Repo
  serviceLocator.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerSingleton<AuthRepositry>(AuthRepositoryImpl(serviceLocator()));
  serviceLocator.registerSingleton<BlogRemoteDataSource>(BlogRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerSingleton<BlogRepository>(BlogReposryImp(serviceLocator()));

  // UseCase
  serviceLocator.registerSingleton<UploadBlogUseCase>(UploadBlogUseCase(serviceLocator()));
  serviceLocator.registerSingleton<UserSignUpUseCase>(UserSignUpUseCase(serviceLocator()));
  serviceLocator.registerSingleton<LogInUseCase>(LogInUseCase(serviceLocator()));
  serviceLocator.registerSingleton<CurrentUserUseCase>(CurrentUserUseCase(serviceLocator()));


  // Bloc/Cubit
  serviceLocator.registerFactory(() => AppUserCubit());
  serviceLocator.registerFactory(() => AuthBloc(userSignUpUseCase: serviceLocator(),userLogInUseCase: serviceLocator(), currentUserUseCase: serviceLocator(), appUserCubit: serviceLocator()),);
  serviceLocator.registerFactory(() => BlogBloc(serviceLocator()));
}
