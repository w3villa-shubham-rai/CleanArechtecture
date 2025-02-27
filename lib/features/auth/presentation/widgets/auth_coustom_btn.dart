


import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:clean_archtecture/core/utils/app_extension.dart';
import 'package:clean_archtecture/core/utils/loding_indicator.dart';
import 'package:flutter/material.dart';
class AuthCustomBtn extends StatefulWidget {
  final String btnName;
  final  VoidCallback onPressed;  
  final GlobalKey<FormState> formKey; 
  final bool isLoading;   
  const AuthCustomBtn({super.key, required this.btnName, required this.onPressed, required this.formKey,this.isLoading = true,});

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
          gradient:  LinearGradient(
            colors: context.theme.brightness==Brightness.light?[
            context.themeColors!.gradient1,
              context.themeColors!.gradient2,
          ]: [
              context.themeColors!.darkGardienTone,
              context.themeColors!.darkGardienTTwo,
            ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          )
        ),
        child: widget.isLoading==false? Center(child: Text(widget.btnName,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)):const Center(child: CustomCircularProgressIndicator(color: AppColors.waterspout,width: 30,height: 30,strokeWidth: 2,)),
      ),
    );
  }
}
