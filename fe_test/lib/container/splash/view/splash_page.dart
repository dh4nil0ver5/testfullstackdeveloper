import 'package:fe_test/util/app_constants.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    AppConstant.initialize(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: AppConstant.width_screen,
          height: AppConstant.height_screen,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFF1F4247),
                Color(0xFF0D1D23),
                Color(0xFF09141A),
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: const Text("test")
        ),
      ),
    );
  }
}
