import 'package:clean_archtecture/Utils/validator.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/app_bar.dart';
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:clean_archtecture/core/utils/show_snackbar.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:clean_archtecture/features/auth/presentation/pages/login_page.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/auth_coustom_btn.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/coustomTextField.dart';
import 'package:clean_archtecture/features/blog/presentation/page/blog_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "SignUp",
        backgroundColor: (Theme.of(context).brightness == Brightness.dark)
            ? (context.themeColors!.firstCardBackGroundColor)
            : (context.themeColors!.gradient1),
        showBackButton: true, 
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: BlocConsumer<AuthBloc, AuthBlocState>(
                listener: (context, state) {
              if (state is AuthFailureState) {
                showSnackBar(context, state.message);
              } else if (state is AuthSuccesState) {
                context.pushAndRemoveUntil(const BlogPage());
              }
            }, 
            builder: (context, state) {
              return Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign Up.",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    30.bh,
                    CoustomAuthTextField(
                      hintText: 'Name',
                      controller: nameController,
                      isPassword: false,
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          ValidatorofForm().nameValidate(value),
                    ),
                    15.bh,
                    CoustomAuthTextField(
                        hintText: 'email',
                        controller: emailController,
                        isPassword: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            ValidatorofForm().emailValidate(value)),
                    15.bh,
                    CoustomAuthTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          ValidatorofForm().passwordValidate(value),
                    ),
                    20.bh,
                    AuthCustomBtn(
                      isLoading: state is AuthLoadingState,
                      btnName: "Sign Up",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthSignUpEvent(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              name: nameController.text.trim()));
                        }
                      },
                      formKey: formkey,
                    ),
                    20.bh,
                    InkWell(
                      onTap: () {
                        context.pushAndRemoveUntil(const LoginPage());
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'All ready  have an account  ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                              TextSpan(
                                  text: 'Sign In',
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.brightness==Brightness.dark? context.themeColors!.borderColor:context.themeColors!.gradient1,
                                  )),
                            ]),
                      ),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
