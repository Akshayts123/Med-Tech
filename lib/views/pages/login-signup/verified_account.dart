import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/dashboard/dashboard.dart';

import '../dashboard/mainscreen.dart';
import '../dashboard/new_dash.dart';
import '../home/home.dart';

class VerifiedAccount extends StatelessWidget {
  const VerifiedAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/confetti.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 50,
                    child: SvgPicture.asset(
                      "assets/images/verify.svg",
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            SizedBox(height: spacer),
            Container(
              child: Text("User Verified",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            SizedBox(height: spacer -30),
            Container(
              width: 260,
              child: Text(
                "Congradulations, your phone number has been verified. You can start using the app",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: spacer,),
            InkWell(
              onTap: (){
                Get.to(MainScreen());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
