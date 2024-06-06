import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 800,
        child: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/nointernet.svg",
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Text("No network connection",style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500),),
            SizedBox(
              height: 10,
            ),
            Text("Try again",style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),),
          ],
        ),),
      ),
    );
  }
}