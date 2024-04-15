import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/auth_coustom_btn.dart';
import 'package:clean_archtecture/features/auth/presentation/widgets/coustomTextField.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey=GlobalKey<FormState>();

  final TextEditingController nameController=TextEditingController();
   final TextEditingController emailController=TextEditingController();
    final TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(13.0),
       child: Form(
        key: formkey,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign Up.",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
             CoustomAuthTextField(hintText: 'Name',controller:nameController ,isPassword: false,keyboardType: TextInputType.name,validator: (value) => nameValidate(value),),
            const SizedBox(height: 15,),
             CoustomAuthTextField(hintText: 'email',controller: emailController,isPassword:false ,keyboardType:TextInputType.emailAddress ,validator:(value) => emailValidate(value)),
            const SizedBox(height: 15,),
             CoustomAuthTextField(hintText: 'Password',controller: passwordController,isPassword:false ,keyboardType:TextInputType.emailAddress ,validator: (value) => passwordValidate(value),),
            const SizedBox(height: 20,),
            AuthCustomBtn(btnName: "Sign Up", onPressed: () {},formKey: formkey,),
            const SizedBox(
              height: 20,
            ),
             RichText(
              text: TextSpan(text: 'All ready  have an account  ',style: Theme.of(context).textTheme.titleMedium,
             children: [
              TextSpan(
                text: 'Sign In',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color:AppColors.gradient2,
                  fontWeight: FontWeight.bold
                )
              ),
             ]),
             )
          ],
         ),
       ),
     ),
    );
  }


  //++++++ Validate function of email +++++++++

 String? emailValidate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

// ++++++++++++++++validate function of Passsword+++++++++++


String? passwordValidate(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 4) {
    return 'Password must be at least 4 characters long';
  }
  return null; 
}


String? nameValidate(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your name';
  }
  return null; 
}

}