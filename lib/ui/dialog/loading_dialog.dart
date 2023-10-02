import 'package:duqing/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
    this.text = '加载中...',
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Lottie.asset(
                      Assets.lotties.loading,
                      width: 60,
                      animate: true,
                    ),
                  ),
                ),
                Text(
                  text ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
