import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interview_task_trissur/controller/authentication/authentication_provider.dart';
import 'package:interview_task_trissur/view/home_page.dart';
import 'package:interview_task_trissur/view/widgets/togglebutton.dart';

class AuthChecker extends HookConsumerWidget {
  const AuthChecker({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //init state in hook//
    useEffect(() {
      ref.read(authenticationProvider.notifier).getToken();
      return null;
    });
    log(ref.watch(authenticationProvider).token.toString());
    return ref.watch(authenticationProvider).token == null
        ? ToggleButton()
        : HomeScreen();
  }
}
