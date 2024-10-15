import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      required this.controller,
      required this.labelText,
      this.obscure,
      this.validator,
      this.suffixIcon});
  final TextEditingController controller;
  final String labelText;
  final bool? obscure;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
