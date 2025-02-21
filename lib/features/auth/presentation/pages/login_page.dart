import 'package:clean_archtecture/Utils/validator.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
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


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final signformkey = GlobalKey<FormState>();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPassWordController = TextEditingController();

 @override
  void dispose() {
    super.dispose();
    loginEmailController.dispose();
    loginPassWordController.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
        title: "Login",
        backgroundColor: AppColors.gradient1, 
        showBackButton: true, 
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: BlocConsumer<AuthBloc, AuthBlocState>(
              listener: (BuildContext context, AuthBlocState state) {
                if (state is AuthSuccesState) {
                  context.pushAndRemoveUntil(const Blogpage());
                }
               
              },
              builder: (BuildContext context, AuthBlocState state) {
                  return Form(
                    key: signformkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Sign In.",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        40.bh,
                        CoustomAuthTextField(
                            hintText: 'email',
                            controller: loginEmailController,
                            isPassword: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>ValidatorofForm().emailValidate(value)),
                         15.bh,
                        CoustomAuthTextField(
                          hintText: 'Password',
                          controller: loginPassWordController,
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => ValidatorofForm().passwordValidate(value),
                        ),
                         20.bh,
                        AuthCustomBtn(
                          isLoading: state is AuthLoadingState,
                          btnName: "Sign In",
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
                                text: 'Don\'t have an account? ',
                                style: Theme.of(context).textTheme.titleMedium,
                                children: [
                                  TextSpan(
                                      text: 'Sign Up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: AppColors.gradient2,
                                              fontWeight: FontWeight.bold)),
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
