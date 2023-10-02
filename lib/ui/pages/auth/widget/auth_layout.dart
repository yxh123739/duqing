import 'package:duqing/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///顶部背景
            _topWidget(),
            Padding(
              padding: const EdgeInsets.all(30).w,
              child: Column(
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topWidget() {
    return Container(
      height: 400.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.loginBack.provider(),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          _smallWidget(
            image: Assets.images.light1.provider(),
            left: 30.w,
            height: 200.w,
          ),
          _smallWidget(
            image: Assets.images.light2.provider(),
            left: 140.w,
            height: 150.w,
          ),
          _smallWidget(
            image: Assets.images.clock.provider(),
            right: 40.w,
            top: 40.w,
            height: 150.w,
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(top: 50).w,
              child: Center(
                  child: Text(
                '读琴',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallWidget({
    required ImageProvider image,
    double? left,
    double? top,
    double height = 150,
    double? right,
  }) {
    return Positioned(
      left: left,
      width: 80.w,
      height: height.w,
      right: right,
      top: top,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: image,
        )),
      ),
    );
  }
}
