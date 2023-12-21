import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task_trissur/controller/authentication/authentication_provider.dart';
import 'package:interview_task_trissur/utils/responsive.dart';
import 'package:interview_task_trissur/view/home_page.dart';
import 'package:interview_task_trissur/view/widgets/auth_button.dart';
import 'package:interview_task_trissur/view/widgets/error_dialogue.dart';
import 'package:interview_task_trissur/view/widgets/padding.dart';
import 'package:interview_task_trissur/view/widgets/auth_field.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/Login.jpg"),
                SizedBox(
                  height: Responsive.height(60, context),
                ),
                AuthField(
                  hinttext: "email",
                  controller: _email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can't be empty";
                    } else if (!value.contains("@") || !value.contains(".")) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
                const Padding20(),
                AuthField(
                  hinttext: "password",
                  obsecure: true,
                  controller: _password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                ),
                const Padding20(),
                AuthButton(
                  text: "LOG IN",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String? errorText = await ref
                          .read(authenticationProvider.notifier)
                          .loginUser(_email.text, _password.text);
                      if (context.mounted) {
                        if (errorText == null) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorDialogue(
                                errorText: errorText,
                              );
                            },
                          );
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
