import 'package:clean_archtecture/Utils/enumtype.dart';
import 'package:clean_archtecture/core/theme/theme.dart';
import 'package:clean_archtecture/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:clean_archtecture/features/auth/data/repositories/auth_repositorie_impl.dart';
import 'package:clean_archtecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/pages/signup_pages.dart';
import 'package:clean_archtecture/secrets/app_secrets_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppSecretsUrl.supabaseUrl, anonKey: AppSecretsUrl.secretsanonKey);
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=> AuthBloc(userSignUp: UserSignUp(AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client),),),),),
     ],
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const SignUpPage(pageType: AuthPageType.signUp),
    );
  }
}
