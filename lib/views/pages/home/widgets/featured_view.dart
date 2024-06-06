

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/padding.dart';

class FeaturedView extends StatelessWidget {
  final image;
  final texts;
  const FeaturedView({Key? key, this.image, this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 90,
          width: 90,
          margin: EdgeInsets.only(right: appPadding),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                )
              ],
              borderRadius: BorderRadius.circular(100)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                fit: BoxFit.contain,
                height: 60,
                width: 60,
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          padding: EdgeInsets.only(left: 0,top: 10),
          child: Text(texts,textAlign:TextAlign.center,style:  Theme.of(context).textTheme.titleMedium,),
        ),
      ],
    );
  }
}
