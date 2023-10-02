import 'package:duqing/routes.dart';
import 'package:duqing/ui/pages/auth/login/login_provider.dart';
import 'package:duqing/ui/pages/auth/widget/auth_layout.dart';
import 'package:duqing/ui/pages/auth/widget/gradient_button.dart';
import 'package:duqing/ui/pages/auth/widget/input_box.dart';
import 'package:duqing/ui/pages/auth/widget/input_widget.dart';
import 'package:duqing/ui/pages/auth/widget/switch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(),
      builder: (ctx, child) => _buildWidget(ctx),
    );
  }

  _buildWidget(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return AuthLayout(
      children: [
        const InputBox(
          children: [
            InputWidget(hintText: '帐号或邮箱'),
            InputWidget(
              hintText: '密码',
              obscureText: true,
              isLast: true,
            ),
          ],
        ),
        30.verticalSpaceFromWidth,
        GradientButton(
          title: '登录',
          onTap: () => context.go(Routes.splash),
        ),
        20.verticalSpaceFromWidth,
        const SwitchPage(
          type: PageType.login,
        ),
      ],
    );
  }
}
