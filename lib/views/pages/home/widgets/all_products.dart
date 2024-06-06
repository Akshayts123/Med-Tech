import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../consts/padding.dart';
import 'dart:math' as math;

class AllProducts extends StatelessWidget {
  final image;
  final text;
  final price;
  final curve;
  final sale;
  AllProducts({Key? key, this.image, this.text, this.price, this.curve, this.sale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: 170,
          margin: EdgeInsets.only(
            right: appPadding,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                )
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFf6f6f8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              price,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFC000),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  "4.2",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Image.asset(
            curve,
            fit: BoxFit.contain,
            height: 60,
            width: 60,
          ),
        ),
        Positioned(
            top: 12,
            left: 3,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Text(
                sale,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ))
      ],
    );
  }
}
