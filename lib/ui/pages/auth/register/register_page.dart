import 'package:duqing/ui/pages/auth/widget/auth_layout.dart';
import 'package:duqing/ui/pages/auth/widget/input_box.dart';
import 'package:duqing/ui/pages/auth/widget/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widget/gradient_button.dart';
import '../widget/switch_page.dart';
import 'register_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<RegisterProvider>();

    return AuthLayout(
      children: [
        InputBox(
          children: [
            InputWidget(
              hintText: '帐号',
              controller: provider.accountController,
            ),
            InputWidget(
              hintText: '密码',
              controller: provider.passwordController,
              obscureText: true,
            ),
            InputWidget(
              hintText: '确认密码',
              controller: provider.confirmPasswdController,
              isLast: true,
              obscureText: true,
            ),
          ],
        ),
        30.verticalSpaceFromWidth,
        GradientButton(
          title: '注册',
          onTap: provider.register,
        ),
        20.verticalSpaceFromWidth,
        const SwitchPage(
          type: PageType.register,
        ),
      ],
    );
  }
}
