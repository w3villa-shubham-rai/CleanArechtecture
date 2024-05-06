import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogEditorTextField extends StatelessWidget {
  TextEditingController controller;
   final String hintText;
  BlogEditorTextField({super.key, required this.controller,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      maxLines: null,
    );
  }
}
