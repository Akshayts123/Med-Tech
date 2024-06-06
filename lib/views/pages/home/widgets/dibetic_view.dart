

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/padding.dart';

class DibeticView extends StatelessWidget {
  final String images;
  final String texts;
  const DibeticView({Key? key, required this.images, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
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
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            child: Container(
              color: Colors.green.shade100,
              child: Image.asset(
                images,
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          ),
          Container(
            width: 70,
            padding: EdgeInsets.all(7),
            child: Text(
              texts,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
