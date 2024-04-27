import 'package:flutter/material.dart';

class CoustomAuthTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  
  const CoustomAuthTextField({super.key, required this.hintText,this.keyboardType = TextInputType.text,this.isPassword = false, required this.controller,this.validator,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}