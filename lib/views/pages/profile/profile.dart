

import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/profile/widgets/accordion.dart';

class Profile extends StatefulWidget {

   Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _headerStyleSmall = TextStyle(
      color: Color(0xffffffff), fontSize: 12, fontWeight: FontWeight.bold);
  final _contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle =  GoogleFonts.poppins(
      color: Colors.grey,
      fontSize: 14,
      height: 2,
      fontWeight: FontWeight.w500);
  final _loremIpsum =
  '''In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.''';
  final _loremIpsum2 =
  '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

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
        title: Text("My Profile", style: Theme.of(context).textTheme.titleSmall),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/man.png",
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Hi, Ben Cline",style:Theme.of(context).textTheme.headlineSmall),
                    ),
                    Container(
                      child: Text("Welcome to Medtech",style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            // AccordionWidget(image: "assets/images/profile1.svg",title: "Private Account", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", ),
            // AccordionWidget(image: "assets/images/profile2.svg",title: "My Consults", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", ),
            // AccordionWidget(image: "assets/images/profile3.svg",title: "My orders", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", ),
            // AccordionWidget(image: "assets/images/profile4.svg",title: "Billing", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", ),
            // AccordionWidget(image: "assets/images/profile5.svg",title: "Faq", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", ),
            // AccordionWidget(image: "assets/images/profile6.svg",title: "Settings", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", ),
            Accordion(
              maxOpenSections: 1,
              headerBorderRadius: 10,
              contentBorderRadius: 10,
              disableScrolling: true,
              contentBorderColor: Colors.white,
              headerBackgroundColor: Colors.white,
              rightIcon: Icon(Icons.arrow_drop_down,color: Colors.black,),
              headerPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 0),
              children: [
                AccordionSection(
                  isOpen: true,
                  leftIcon: SvgPicture.asset(
                    "assets/images/profile1.svg",
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  header: Text('Private Account', style: Theme.of(context).textTheme.titleSmall),
                  content: Text(_loremIpsum2, style: _contentStyle),
                  contentHorizontalPadding: 20,
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: SvgPicture.asset(
                    "assets/images/profile2.svg",
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  header: Text('My Consults', style:Theme.of(context).textTheme.titleSmall),
                  content:Text(_loremIpsum2, style: _contentStyle),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: SvgPicture.asset(
                    "assets/images/profile3.svg",
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  header: Text('My orders', style: Theme.of(context).textTheme.titleSmall),
                  content:Text(_loremIpsum2, style: _contentStyle),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon:  SvgPicture.asset(
                    "assets/images/profile4.svg",
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  header: Text('Billing', style: Theme.of(context).textTheme.titleSmall),
                  content:
                  Text(_loremIpsum2, style: _contentStyle),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon:  SvgPicture.asset(
                    "assets/images/profile5.svg",
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  header: Text('Faq', style: Theme.of(context).textTheme.titleSmall),
                  content: Text(_loremIpsum2, style: _contentStyle),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: SvgPicture.asset(
                    "assets/images/profile6.svg",
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  header: Text('Settings', style: Theme.of(context).textTheme.titleSmall),
                  content:Text(_loremIpsum2, style: _contentStyle),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
