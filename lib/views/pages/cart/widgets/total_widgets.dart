

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalWidgets extends StatelessWidget {
  final headtotal;
  final total;
  const TotalWidgets({Key? key, this.headtotal, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headtotal,style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500),),
        Text(total,style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500),),
      ],
    );
  }
}
