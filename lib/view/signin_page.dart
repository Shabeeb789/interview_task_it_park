import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task_trissur/controller/authentication/authentication_provider.dart';
import 'package:interview_task_trissur/utils/responsive.dart';
import 'package:interview_task_trissur/view/home_page.dart';
import 'package:interview_task_trissur/view/widgets/auth_button.dart';
import 'package:interview_task_trissur/view/widgets/error_dialogue.dart';
import 'package:interview_task_trissur/view/widgets/padding.dart';
import 'package:interview_task_trissur/view/widgets/auth_field.dart';

class SigninPage extends ConsumerWidget {
  SigninPage({super.key});

  final TextEditingController _nameController =
      TextEditingController(text: "Shabeeb");
  final TextEditingController _emailController =
      TextEditingController(text: "shabeeb1@gmail.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "password");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Responsive.height(10, context),
              ),
              Image.asset("assets/images/Login.jpg"),
              AuthField(
                hinttext: "name",
                controller: _nameController,
                icon: const Icon(Icons.person),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name can't be empty";
                  }
                  return null;
                },
              ),
              const Padding20(),
              AuthField(
                hinttext: "email",
                controller: _emailController,
                icon: const Icon(Icons.email_rounded),
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
                controller: _passwordController,
                icon: const Icon(Icons.password),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Responsive.height(20, context),
              ),
              AuthButton(
                text: "SIGN IN",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String? errorText = await ref
                        .read(authenticationProvider.notifier)
                        .registerUser(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                        );
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
    );
  }
}
