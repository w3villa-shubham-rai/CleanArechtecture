import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthCustomBtn extends StatefulWidget {
  final String btnName;
  final  VoidCallback onPressed;  
  final GlobalKey<FormState> formKey;       
  const AuthCustomBtn({super.key, required this.btnName, required this.onPressed, required this.formKey});

  @override
  State<AuthCustomBtn> createState() => _AuthCustomBtnState();
}

class _AuthCustomBtnState extends State<AuthCustomBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          if (widget.formKey.currentState!.validate()) {
            widget.onPressed();
          }
      },
      child: Container(
        height: 55,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(colors: [
            AppColors.gradient1,
            AppColors.gradient2
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          )
        ),
        child: const Center(child: Text("Sign Up",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
