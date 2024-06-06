
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

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({Key? key}) : super(key: key);

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
            SizedBox(height: spacer +30),
            Container(
              child: Text("Thank you",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            SizedBox(height: spacer -30,),
            Container(
              width: 260,
              child: Text(
                "Your Order will be delivered with invoice #9ds69hs. You can track the delivery in the order section.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: spacer + spacer,),
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
                    "Continue Order",
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
