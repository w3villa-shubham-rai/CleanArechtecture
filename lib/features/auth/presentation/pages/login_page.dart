import 'package:clean_archtecture/Utils/validator.dart';
import 'package:clean_archtecture/core/utils/app_bar.dart';
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:clean_archtecture/features/auth/presentation/pages/signup_pages.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/auth_coustom_btn.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/coustomTextField.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final signformkey = GlobalKey<FormState>();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPassWordController = TextEditingController();
   Locale _currentLocale = const Locale('en');

 @override
  void dispose() {
    super.dispose();
    loginEmailController.dispose();
    loginPassWordController.dispose();
  }

  void _toggleLanguage() {
    setState(() {
      if (_currentLocale.languageCode == 'en') {
        _currentLocale = const Locale('es');
      } else {
        _currentLocale = const Locale('en');
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: CustomAppBar(
        title: l10n.loginTitle,
          backgroundColor: (Theme.of(context).brightness == Brightness.dark)
              ? (context.themeColors!.firstCardBackGroundColor)
              : (context.themeColors!.gradient1),
        showBackButton: true,

      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: BlocConsumer<AuthBloc, AuthBlocState>(
              listener: (BuildContext context, AuthBlocState state) {
                if (state is AuthSuccesState) {
                  context.pushAndRemoveUntil(const BlogPage());
                }
               
              },
              builder: (BuildContext context, AuthBlocState state) {
                  return Form(
                    key: signformkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.signIn,style: const TextStyle( fontSize: 50, fontWeight: FontWeight.bold), ),
                        40.bh,
                        CoustomAuthTextField(
                            hintText: l10n.emailHint,
                            controller: loginEmailController,
                            isPassword: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>ValidatorofForm().emailValidate(value)),
                         15.bh,
                        CoustomAuthTextField(
                          hintText: l10n.passwordHint,
                          controller: loginPassWordController,
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => ValidatorofForm().passwordValidate(value),
                        ),
                         20.bh,
                        AuthCustomBtn(
                          isLoading: state is AuthLoadingState,
                          btnName: l10n.signIn,
                          onPressed: () {
                            if (signformkey.currentState!.validate()) {
                              context.read<AuthBloc>().add(AuthLoginEvent(
                                email: loginEmailController.text.trim(),
                                  password: loginPassWordController.text.trim()));
                            }
                          },
                          formKey: signformkey,
                        ),
                        20.bh,
                        InkWell(
                          onTap: () {
                            context.pushReplacement(const SignUpPage());
                          },
                          child: RichText(
                            text: TextSpan(
                                text: '${l10n.dontHaveAccount} ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.brightness==Brightness.dark? context.themeColors!.borderColor:context.themeColors!.gradient1,
                                ),
                                children: [
                                  TextSpan(
                                      text: l10n.signUp,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: context.theme.brightness==Brightness.dark? context.themeColors!.borderColor:context.themeColors!.gradient1,
                                      )
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                  );
                
              },
            ),
          ),
        ));
  }
}
