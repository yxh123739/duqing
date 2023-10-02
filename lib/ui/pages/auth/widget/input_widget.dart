import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    this.isLast = false,
    this.controller,
    this.obscureText = false,
    required this.hintText,
    this.onChanged,
  });

  final bool isLast;
  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom:
              isLast ? BorderSide.none : BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
