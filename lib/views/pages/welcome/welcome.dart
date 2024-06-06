import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/login-signup/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: spacer + 0,
              ),
              Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: spacer,
              ),
              Text(
                "Welcome to Medtech",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: spacer - 20,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  "Do you want some help with your health to get better life?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: spacer -30,
              ),
              InkWell(
                onTap: (){
                  Get.to(Login());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Sign up with email",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spacer - 30,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.4,color: Colors.black ),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/facebook1.svg",fit: BoxFit.cover,height: 20,),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with facebook",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: spacer - 30,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.4,color: Colors.black ),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/google.svg",fit: BoxFit.cover,height: 20,),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with Gmail",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
