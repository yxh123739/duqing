import 'package:duqing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum PageType {
  login,
  register,
}

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key, required this.type});

  final PageType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type == PageType.login ? '没有帐号？' : '已有帐号？',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey[700]!,
          ),
        ),
        InkWell(
          onTap: () => context
              .go(type == PageType.login ? Routes.register : Routes.login),
          child: Text(
            type == PageType.login ? '去注册' : '去登录',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
