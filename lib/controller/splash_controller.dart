import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../views/pages/introduction/intro.dart';

class SplashScreenViewModel extends  GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
  }

  animationInitilization() {
    Timer(Duration(seconds: 5),
            () => Get.to(OnboardScreenLive()));
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }
}