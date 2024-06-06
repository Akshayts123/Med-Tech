import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AccordionWidget extends StatefulWidget {
  final String title;
  final String content;
  final String image;

  AccordionWidget(
      {required this.title, required this.content, required this.image});

  @override
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Column(
            children: [
              Container(
                // color: Colors.grey[100],
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          widget.image,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        // Image.asset("assets/images/5.png",height: 30,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.title,
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                    Icon(
                      _expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 0.55,
              //   color: Colors.grey,
              //   width: double.infinity,
              // ),
            ],
          ),
        ),
        if (_expanded)
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Text(
              widget.content,
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 2,
                  fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }
}
