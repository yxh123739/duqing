import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final accountController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    debugPrint('account: ${accountController.text}');
  }
}
