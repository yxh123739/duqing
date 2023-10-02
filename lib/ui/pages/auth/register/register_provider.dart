import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswdController = TextEditingController();

  void register() {}
}
