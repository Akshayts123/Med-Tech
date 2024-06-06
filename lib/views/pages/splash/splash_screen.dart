import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00BBC9),
      body: GetBuilder<SplashScreenViewModel>(
        init: SplashScreenViewModel(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/stripe.png"))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/medlogos.png',
                      width: controller.animation.value * 150,
                      height: controller.animation.value * 150,
                    ),
                    Text("MedTech",style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}