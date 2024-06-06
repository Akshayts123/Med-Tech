import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/notification/widgets/detail_notifi.dart';

class Notifi extends StatelessWidget {
  const Notifi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Notification", style: Theme.of(context).textTheme.titleSmall),
        actions: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Text("Clear All",style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailedNotifi(image:"assets/images/notifi1.svg" ,notification: "We know that — for children AND adults — learning is most effective when it is",notifidate: "Aug 12, 2020 at 12:08 PM",),
            DetailedNotifi(image:"assets/images/notifi2.svg" ,notification: "The future of professional learning is immersive, communal experiences for ",notifidate: "Aug 12, 2020 at 12:08 PM",),
            DetailedNotifi(image:"assets/images/notifi3.svg" ,notification: "With this in mind, Global Online Academy created the Blended Learning Design ",notifidate: "Aug 12, 2020 at 12:08 PM",),
            DetailedNotifi(image:"assets/images/notifi3.svg" ,notification: "Technology should serve, not drive, pedagogy. Schools often discuss ",notifidate: "Aug 12, 2020 at 12:08 PM",),
            DetailedNotifi(image:"assets/images/notifi3.svg" ,notification: "Peer learning works. By building robust personal learning communities both   ",notifidate: "Aug 12, 2020 at 12:08 PM",),
          ],
        ),
      ),
    );
  }
}
