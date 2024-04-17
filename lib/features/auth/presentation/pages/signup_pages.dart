import 'package:clean_archtecture/Utils/enumtype.dart';
import 'package:clean_archtecture/Utils/validator.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/auth_coustom_btn.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/coustomTextField.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
   final AuthPageType pageType;
  const SignUpPage({super.key, required this.pageType});


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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
        Visibility(
          visible:  widget.pageType == AuthPageType.signUp,
          child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.of(context).pop();
                 },
            ),
        ),
  
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                 widget.pageType == AuthPageType.login?"Sign In.":"Sign Up.",
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Visibility(
                visible: widget.pageType == AuthPageType.signUp,
                child: const SizedBox(
                  height: 30,
                ),
              ),
              Visibility(
                visible: widget.pageType == AuthPageType.signUp,
                child: CoustomAuthTextField(
                  hintText: 'Name',
                  controller: nameController,
                  isPassword: false,
                  keyboardType: TextInputType.name,
                  validator: (value) => ValidatorofForm().nameValidate(value),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CoustomAuthTextField(
                  hintText: 'email',
                  controller: emailController,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => ValidatorofForm().emailValidate(value)),
              const SizedBox(
                height: 15,
              ),
              CoustomAuthTextField(
                hintText: 'Password',
                controller: passwordController,
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => ValidatorofForm().passwordValidate(value),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthCustomBtn(
                btnName: "Sign Up",
                onPressed: () {
                  print("hiii+++++++++++");
                },
                formKey: formkey,
                signUpPageType:widget.pageType ,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if(widget.pageType == AuthPageType.signUp){
                     Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(pageType: AuthPageType.login),
                    ),
                  );
                }
                else{
                   Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(pageType: AuthPageType.signUp),
                    ),
                  );
                }
                 
                },
                child: RichText(
                  text: TextSpan(
                      text:widget.pageType == AuthPageType.login?'Don\'t have an account? ': 'All ready  have an account  ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: widget.pageType == AuthPageType.login?'Sign Up':'Sign In',
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
        ),
      ),
    );
  }
}


