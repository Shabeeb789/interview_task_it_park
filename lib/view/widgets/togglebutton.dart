import 'package:flutter/material.dart';
import 'package:interview_task_trissur/view/signin_page.dart';
import 'package:interview_task_trissur/view/login_page.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final pageController = PageController();
  final List<bool> _signupor = <bool>[true, false];

  final List<Widget> loginorsignup = [
    const Text("SIGN UP"),
    const Text("LOG IN"),
  ];

  final List<Widget> pages = [
    SigninPage(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                  controller: pageController,
                  itemCount: loginorsignup.length,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                constraints: const BoxConstraints(
                  minHeight: 60,
                  minWidth: 120,
                ),
                fillColor: Colors.teal,
                color: Colors.teal,
                selectedColor: Colors.white,
                isSelected: _signupor,
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(
                    () {
                      for (var i = 0; i < loginorsignup.length; i++) {
                        _signupor[i] = i == index;
                        if (i == index) {
                          pageController.animateToPage(i,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                      }
                    },
                  );
                },
                children: loginorsignup,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
