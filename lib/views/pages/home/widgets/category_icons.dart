

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home.dart';

class CatIcons extends StatelessWidget {
  final index;
  final color1;
  final color2;
  final image;
  final description;
  const CatIcons({Key? key, this.index, this.color1, this.color2, this.image, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 55,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              offset: Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.circular(50)),
      child: Column(
        children: [
          SizedBox(
            height: 7,
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    color1,
                   color2,
                  ],
                ),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: SvgPicture.asset(
                image,
                fit: BoxFit.cover,
                height: 20,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            child: Text(
              description,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
