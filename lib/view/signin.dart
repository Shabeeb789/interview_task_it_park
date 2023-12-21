import 'package:flutter/material.dart';
import 'package:interview_task_trissur/utils/responsive.dart';
import 'package:interview_task_trissur/widgets/elevatedbutton.dart';
import 'package:interview_task_trissur/widgets/padding.dart';
import 'package:interview_task_trissur/widgets/textfield.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Responsive.height(60, context),
              ),
              TextFields(hinttext: "email", controller: email),
              const Padding20(),
              TextFields(hinttext: "password", controller: password),
              const Padding20(),
              Button(text: "LOG IN"),
            ],
          ),
        ),
      ),
    );
  }
}
