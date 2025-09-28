import 'dart:async';

import 'package:advanced_project/presentation/resources/assets_manager.dart';
import 'package:advanced_project/presentation/resources/color_manager.dart';
import 'package:advanced_project/presentation/resources/constant_manager.dart';
import 'package:advanced_project/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _startDelay() {
    _timer = Timer(ConstantManager.splashDelay, _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image.asset(ImagesAssets.splashLogo)),
    );
  }
}
