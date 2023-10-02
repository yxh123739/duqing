import 'package:duqing/extensions/color_ext.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: CustomColor.loginShadowColor,
              blurRadius: 20.0,
              offset: const Offset(0, 10),
            ),
          ]),
      child: Column(
        children: children,
      ),
    );
  }
}
