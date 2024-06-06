
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/views/pages/home/home.dart';

import '../welcome/welcome.dart';



class OnboardScreenLive extends StatefulWidget {
  const OnboardScreenLive({Key? key}) : super(key: key);

  @override
  State<OnboardScreenLive> createState() => _OnboardScreenLiveState();
}

class _OnboardScreenLiveState extends State<OnboardScreenLive> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnLiveBoard(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Skip",style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor, fontSize: 15, fontWeight: FontWeight.w600),),
                  Spacer(),
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      if(_pageIndex ==2){
                        Get.to(Welcome());
                      }
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: Text("Next",style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor, fontSize: 15, fontWeight: FontWeight.w600),),
                  ),
                  // Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   decoration: BoxDecoration(
                  //       color: Theme.of(context).primaryColor,
                  //     borderRadius: BorderRadius.circular(50)
                  //   ),
                  //   child: TextButton(
                  //
                  //     onPressed: () {
                  //       if(_pageIndex == 3){
                  //         Get.to(HomeScreen());
                  //       }
                  //       _pageController.nextPage(
                  //           duration: Duration(milliseconds: 300),
                  //           curve: Curves.ease);
                  //     },
                  //     style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(),),
                  //     child: Icon(Icons.arrow_forward,color: Colors.white,),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 6 : 6,
      width: 6,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoardContent {
  final String image, title, description;
  OnBoardContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoardContent> demo_data = [
  OnBoardContent(
      image: "assets/images/onboard1.png",
      title: "View and buy Medicine online",
      description: "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer. "),
  OnBoardContent(
      image: "assets/images/onboard2.png",
      title: "Online medical & Healthcare",
      description: "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer."),
  OnBoardContent(
      image: "assets/images/onboard3.png",
      title: "Get Delivery on time",
      description: "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer."),
];

class OnLiveBoard extends StatelessWidget {
  final String image, title, description;
  const OnLiveBoard(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              image,
              height: 350,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              description,
              textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
            )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
