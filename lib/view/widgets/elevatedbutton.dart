import 'package:flutter/material.dart';
import 'package:interview_task_trissur/utils/responsive.dart';

class Button extends StatelessWidget {
  String text;
  Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          fixedSize: Size(MediaQuery.of(context).size.width, 60)),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
