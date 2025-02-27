import 'package:clean_archtecture/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_archtecture/core/common/cubits/app_user/app_user_state.dart';
import 'package:clean_archtecture/features/aichat/presentation/bloc/google_ai_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/pages/login_page.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_Page.dart';
import 'package:clean_archtecture/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  await ThemeManager().init();

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
      BlocProvider(
        create: (_) => serviceLocator<GoogleAiBloc>(),
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

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{




  @override
  void initState() {
    super.initState();
    appInit();
    WidgetsBinding.instance.addObserver(this); // Add observer to listen for theme changes
    _updateSystemTheme(); // Initial theme update
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer to prevent memory leaks
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _updateSystemTheme(); // Update the theme dynamically
  }

  void _updateSystemTheme() {
    debugPrint("theme Change here ");
    Brightness brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    ThemeManager().updateSystemTheme(brightness);
  }

  Future appInit() async {
    context.read<AuthBloc>().add(AuthIsUserLoggedInEvent());
  }



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeManager().themeNotifier,
        builder: (context, value, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: value,
              debugShowCheckedModeBanner: false,
              home: BlocSelector<AppUserCubit, AppUserState, bool>(
                selector: (state) {
                  return state is AppUserLoggedIn;
                },
                builder: (context, isLoggedIn) {
                  if (isLoggedIn) {
                    return const BlogPage();
                  }
                  else{
                    return const LoginPage();
                  }
                },
              ));
        },
    );
  }
}
