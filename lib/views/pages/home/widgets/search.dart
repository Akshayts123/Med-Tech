import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.hintField,
    this.backgroundColor,
  }) : super(key: key);

  final String hintField;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10.0,
          offset: Offset(0, 5),
        )
      ], color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(40.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            child: Container(
              child: SvgPicture.asset(
                "assets/images/search.svg",
                fit: BoxFit.cover,
              )
            ),
          ),
          Flexible(
            child: Container(
              width: size.width,
              height: 27,
              alignment: Alignment.topCenter,
              child: TextField(
                style: TextStyle(fontSize: 13),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: hintField,
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color:
                    Colors.grey,
                    fontWeight: FontWeight.w500
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
