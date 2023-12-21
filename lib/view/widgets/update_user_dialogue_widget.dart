import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task_trissur/controller/authentication/authentication_provider.dart';
import 'package:interview_task_trissur/view/widgets/auth_button.dart';
import 'package:interview_task_trissur/view/widgets/auth_field.dart';

class UpdateUserDialogue extends ConsumerWidget {
  const UpdateUserDialogue({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController name,
    required TextEditingController password,
  })  : _formKey = formKey,
        _name = name,
        _password = password;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _name;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("Update User"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AuthField(
              hinttext: "User Name",
              controller: _name,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Name can't be empty";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            AuthField(
              hinttext: "Password",
              controller: _password,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password can't be empty";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            AuthButton(
              text: "Update",
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  bool isUpdated = await ref
                      .read(authenticationProvider.notifier)
                      .updateUser(_name.text, _password.text);
                  if (context.mounted) {
                    if (isUpdated) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("User updated successfully"),
                          backgroundColor: Colors.teal,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Can't update user, please try again"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
