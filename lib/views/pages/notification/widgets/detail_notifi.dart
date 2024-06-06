import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../consts/padding.dart';

class DetailedNotifi extends StatelessWidget {
  final image;
  final notification;
  final notifidate;
  const DetailedNotifi({Key? key, this.image, this.notification, this.notifidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Container(
          padding: EdgeInsets.all(appPadding ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: SvgPicture.asset(
                  image,
                  height: 22,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    child: Text(notification, style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 5,),
                  Text(notifidate,style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),)
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 0.3,
          width: double.infinity,
        ),
      ],
    );
  }
}
