import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/home/widgets/all_products.dart';
import 'package:medtech/views/pages/home/widgets/category_icons.dart';
import 'package:medtech/views/pages/home/widgets/deals_view.dart';
import 'package:medtech/views/pages/home/widgets/dibetic_view.dart';
import 'package:medtech/views/pages/home/widgets/featured_view.dart';
import 'package:medtech/views/pages/home/widgets/search.dart';
import 'package:medtech/views/pages/home/widgets/slider_view.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/wishlist_controller.dart';
import '../../../models/items.dart';
import '../home_inner_page/home_inner_page.dart';

final HomeController coffeeController = Get.put(HomeController());
final WishlistController wishlistController = Get.put(WishlistController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(appPadding),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-10, 0),
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        image: AssetImage(
                          "assets/images/circle4.png",
                        )),
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/images/man.png",
                                  fit: BoxFit.cover,
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/notification.svg",
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/inbox.svg",
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "Hi, Akshay",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "Welcome to E Pharma",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              FractionalTranslation(
                translation: Offset(0.0, -0.50),
                child: Search(
                  hintField: 'Search Medicine & Healthcare products',
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: appPadding),
                child: Text("Top Categories",
                    style: Theme.of(context).textTheme.titleSmall),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 107,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 13, left: appPadding),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeController.category.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CatIcons(
                      image: coffeeController.category[index].image,
                      index: index,
                      color1: coffeeController.colors[index],
                      color2: coffeeController.colors2[index],
                      description: coffeeController.category[index].text,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SliderScreen(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Products",
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    Container(
                      child: Text(
                        "More",
                        style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                itemCount: DealsModel.deals.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: EdgeInsets.only(left: appPadding),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 10 / 12,
                  crossAxisCount: 2,
                  mainAxisSpacing: appPadding,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(HomeInnerPage(
                        index: index,
                        heading: DealsModel.deals[index].text,
                        images: DealsModel.deals[index].image,
                        price: DealsModel.deals[index].price.toString(),
                      ));
                    },
                    child: DealsView(
                      image: DealsModel.deals[index].image,
                      text: DealsModel.deals[index].text,
                      price: DealsModel.deals[index].price.toString(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
