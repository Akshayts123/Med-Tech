
import 'package:flutter/material.dart';

class ReviewChart extends StatelessWidget {
  const ReviewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          chartRow(context, '5', 89),
          chartRow(context, '4', 49),
          chartRow(context, '3', 20),
          chartRow(context, '4', 19),
          chartRow(context, '1', 10),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget chartRow(BuildContext context, String label, int pct) {
    return Row(
      children: [
        Text(label, ),
        SizedBox(width: 8),
        Icon(Icons.star, color: Color(0xFFFFC000),),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
          child:
          Stack(
              children: [
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.36,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(''),
                ),
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width * (pct/100) * 0.36,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFC000),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(''),
                ),
              ]

          ),
        ),
        Text('$pct%'),
      ],
    );
  }
}