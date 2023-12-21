import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          fixedSize: Size(MediaQuery.of(context).size.width, 60)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
