import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final Icon? icon;
  final String? Function(String? value)? validator;
  final bool? obsecure;

  final String? hinttext;
  const AuthField({
    super.key,
    required this.hinttext,
    required this.controller,
    this.icon,
    this.validator,
    this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure ?? false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        prefixIcon: icon,
        hintText: hinttext,
        labelText: "Enter your $hinttext",
      ),
      controller: controller,
      validator: validator,
    );
  }
}
