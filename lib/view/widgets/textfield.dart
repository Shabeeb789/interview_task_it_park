import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final Icon? icon;

  final String? hinttext;
  const TextFields(
      {super.key, required this.hinttext, required this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          prefixIcon: icon,
          hintText: hinttext,
          labelText: "Enter your $hinttext"),
      controller: controller,
    );
  }
}
