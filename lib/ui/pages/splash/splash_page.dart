import 'package:duqing/ui/pages/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../refresh/refresh_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  _buildPage(BuildContext context) {
    final provider = Provider.of<SplashProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Flutter Page Load Data Demo',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: RefreshWidget<SplashProvider>(
          context: context,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 15),
            itemCount: provider.data.length,
            itemBuilder: (ctx, index) {
              return Text(
                'mock data item${provider.data[index]}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left,
              );
            },
          ),
        ),
      ),
    );
  }
}
