import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../consts/padding.dart';

class DealsView extends StatelessWidget {
  final image;
  final text;
  final price;
   DealsView({Key? key, this.image, this.text, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 160,
      margin: EdgeInsets.only(right: appPadding,),
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
            padding: EdgeInsets.only(
                left: 10, right: 0, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  child: Text(
                    text,
                    style:
                    Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          price,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall,
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
                          mainAxisAlignment:
                          MainAxisAlignment.center,
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
    );
  }
}
