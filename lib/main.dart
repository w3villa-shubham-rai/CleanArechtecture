import 'package:clean_archtecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_archtecture/core/common/cubits/app_user/app_user_state.dart';
import 'package:clean_archtecture/core/theme/theme.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:clean_archtecture/features/auth/presentation/pages/login_page.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_Page.dart';
import 'package:clean_archtecture/geit_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<BlogBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future appInit() async {
    context.read<AuthBloc>().add(AuthIsUserLoggedInEvent());
  }

  _userListner(BuildContext context, AuthBlocState state) {
    if (state is AuthSuccesState) {
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => const Blogpage()));
    }
  }

  @override
  void initState() {
    super.initState();
    appInit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeMode,
        home: BlocSelector<AppUserCubit, AppUserState, bool>(
          selector: (state) {
            return state is AppUserLoggedIn;
          },
          builder: (context, isLoggedIn) {
            if (isLoggedIn) {
              return const Blogpage();
            }
            return BlocConsumer<AuthBloc, AuthBlocState>(
              listener: _userListner,
              builder: (context, state) {
                return const LoginPage();
              }
            );
          },
        ));
  }
}
