import 'package:flutter/material.dart';
import 'package:interview_task_trissur/utils/responsive.dart';
import 'package:interview_task_trissur/view/widgets/elevatedbutton.dart';
import 'package:interview_task_trissur/view/widgets/padding.dart';
import 'package:interview_task_trissur/view/widgets/textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Responsive.height(10, context),
            ),
            TextFields(
              hinttext: "name",
              controller: namecontroller,
              icon: const Icon(Icons.person),
            ),
            const Padding20(),
            TextFields(
              hinttext: "email",
              controller: passwordcontroller,
              icon: const Icon(Icons.email_rounded),
            ),
            const Padding20(),
            TextFields(
              hinttext: "password",
              controller: emailcontroller,
              icon: const Icon(Icons.password),
            ),
            SizedBox(
              height: Responsive.height(20, context),
            ),
            Button(text: "SIGNUP"),
          ],
        ),
      ),
    );
  }
}
