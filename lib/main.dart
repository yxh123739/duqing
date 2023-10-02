import 'package:duqing/gen/assets.gen.dart';
import 'package:duqing/routes.dart';
import 'package:duqing/ui/pages/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'utils/keyboard.dart';

void main() {
  runApp(
    const MyApp(),
  );
  transparentStatusBar();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 867.4),
      minTextAdapt: true,
      builder: (ctx, child) {
        return MaterialApp.router(
          routerConfig: Routes.router,
          debugShowCheckedModeBanner: false,
          title: '读琴',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: Assets.fonts.kai,
          ),
          builder: FlutterSmartDialog.init(
            builder: (context, child) {
              return Scaffold(
                body: GestureDetector(
                  onTap: () => KeyboardUtils.hideKeyboard(context),
                  child: child,
                ),
              );
            },
          ),
        );
      },
      child: const LoginPage(),
    );
  }
}

///透明状态栏
transparentStatusBar() {
  SystemUiOverlayStyle style = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}
