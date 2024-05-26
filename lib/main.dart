import 'package:clean_archtecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_archtecture/core/common/cubits/app_user/app_user_state.dart';
import 'package:clean_archtecture/core/services/theme_service.dart';
import 'package:clean_archtecture/core/utils/app_preferences.dart';
import 'package:clean_archtecture/core/utils/app_type_def.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/pages/login_page.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_Page.dart';
import 'package:clean_archtecture/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  await initAllService();

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

FVoid initAllService() async {
  AppPreference.init();
  ThemeService.themeService.init();
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


  @override
  void initState() {
    super.initState();
    appInit();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeService.themeService.themeListener,
      builder: (context, value, child) {
        return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeService.themeService.getTheme(context),
            home: BlocSelector<AppUserCubit, AppUserState, bool>(
              selector: (state) {
                return state is AppUserLoggedIn;
              },
              builder: (context, isLoggedIn) {
                if (isLoggedIn) {
                  return const Blogpage();
                }
                else{
                      return const LoginPage();
                }
              },
            ));
      }
    );
  }
}
