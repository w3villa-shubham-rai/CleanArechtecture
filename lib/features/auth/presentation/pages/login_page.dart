import 'package:clean_archtecture/Utils/enumtype.dart';
import 'package:clean_archtecture/Utils/validator.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/loader_frame.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_archtecture/features/auth/presentation/bloc/auth_state.dart';
import 'package:clean_archtecture/features/auth/presentation/pages/signup_pages.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/auth_coustom_btn.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/coustomTextField.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: BlocConsumer<AuthBloc, AuthBlocState>(
            listener: (BuildContext context, AuthBlocState state) { 
              
             },
            builder: (BuildContext context, AuthBlocState state) { 
              if(state is AuthLoadingState){
                return  const Center(child: LoaderFrame());
              }
              else if(state is AuthFailureState){
                 return Text(state.message);
              }
              else{
              return Form(
              key: signformkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign In.",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CoustomAuthTextField(
                      hintText: 'email',
                      controller: loginEmailController,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          ValidatorofForm().emailValidate(value)),
                  const SizedBox(
                    height: 15,
                  ),
                  CoustomAuthTextField(
                    hintText: 'Password',
                    controller: loginPassWordController,
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        ValidatorofForm().passwordValidate(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthCustomBtn(
                    btnName: "Sign In",
                    onPressed: () {
                     if(signformkey.currentState!.validate()){
                       context.read<AuthBloc>().add(
                        AuthLoginEvent(email: loginEmailController.text.trim(), password: loginPassWordController.text.trim())
                      );
                     }
                    },
                    formKey: signformkey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SignUpPage(),
                        ),
                      );
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
          
              }
             },
        ),
        ));
  }
}
