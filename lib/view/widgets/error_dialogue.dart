import 'package:flutter/material.dart';

class ErrorDialogue extends StatelessWidget {
  final String errorText;
  const ErrorDialogue({
    super.key,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error Occured"),
      content: Text(errorText),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
          ),
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
