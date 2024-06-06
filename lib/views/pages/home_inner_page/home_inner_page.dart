import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'hide Badge;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/home/home.dart';
import 'package:medtech/views/pages/home_inner_page/widgets/rating_bars.dart';

import '../../../models/items.dart';
import '../cart/cart_screen.dart';
import '../delivery_screen/delivery.dart';
import '../delivery_screen/delivery_screen.dart';
import '../wishlist/wishlist.dart';

class HomeInnerPage extends StatefulWidget {
  final index;
  final String heading;
  final String images;
  final price;
  HomeInnerPage(
      {Key? key,
      required this.heading,
      required this.images,
      this.price,
      this.index})
      : super(key: key);

  @override
  State<HomeInnerPage> createState() => _HomeInnerPageState();
}

late final DealsModel dealing;

class _HomeInnerPageState extends State<HomeInnerPage> {
  int rounded = 15;
  GetStorage box = GetStorage();
  List<String> day = [
    "₹106",
    "₹166",
    "₹256",
  ];

  List<int> days = [
    15,
    25,
    35,
  ];

  int _selectedIndex2 = 0;
  Widget countButton(int index, void Function(int index) counter,
      {IconData icon = Icons.add}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15,
      ),
      shape: const CircleBorder(),
    );
  }

  late final DealsModel dealing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.to(WishlistPage());
                  },
                  child: SvgPicture.asset(
                    "assets/images/noti.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Obx(
                  () => InkWell(
                    onTap: () => Get.to(() => const CartScreen()),
                    child: Badge(
                      badgeContent: Text(
                        "${cartController.products.length}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      // padding: const EdgeInsets.all(3.8),
                      //badgeColor: Colors.white,
                      showBadge: cartController.products.length > 0,
                      position: BadgePosition.topEnd(top: -12, end: -7),
                      child: Image.asset(
                        "assets/images/cart.png",
                        color: Colors.black,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: appPadding, right: appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.heading,
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(
                height: 10,
              ),
              Text(
                "Etiam mollis metus non purus ",
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFFf6f6f8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        widget.images,
                        fit: BoxFit.contain,
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "₹${widget.price ?? 111}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Etiam mollis",
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            wishlistController.isInWishlist.toggle();
                            final item = DealsModel(
                              id: dealing.id,
                              price: dealing.price,
                              image: dealing.image,
                              count: dealing.count,
                              text: dealing.text,
                            );
                            wishlistController.addToWishlist(item);
                          },
                          child: Obx(
                            () => Icon(
                              wishlistController.isInWishlist.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              // Get.to(Laravel());
                            },
                            child: Icon(
                              Icons.share,
                              color: Theme.of(context).primaryColor,
                            )),
                      ],
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Get.to(Laravel());
                    //     cartController
                    //         .addProductStack(DealsModel.deals[widget.index]);
                    //   },
                    //   child: Row(
                    //     children: [
                    //      Image.asset(
                    //         "assets/images/favourite.png",
                    //         height: 20,
                    //         color: Theme.of(context).primaryColor,
                    //         fit: BoxFit.cover,
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       // Text(
                    //       //   "Add to Wishlist",
                    //       //   style: GoogleFonts.poppins(
                    //       //       color: Theme.of(context).primaryColor,
                    //       //       fontSize: 15,
                    //       //       fontWeight: FontWeight.w500),
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 0.4,
                width: double.infinity,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                height: 15,
              ),
              Text("Package size",
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Wrap(
                  children: day.asMap().entries.map((entry) {
                    int index = entry.key;
                    String title = entry.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex2 = index;
                          rounded = days[index];
                          print("::::::index::::::");
                          print(rounded);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 0, bottom: 0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 17.0, vertical: 15),
                        decoration: BoxDecoration(
                          border: _selectedIndex2 == index
                              ? Border.all(
                                  width: 1,
                                  color: Theme.of(context).primaryColor)
                              : Border.all(
                                  width: 0,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                ),
                          color: _selectedIndex2 == index
                              ? Theme.of(context).primaryColor.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.poppins(
                                  color: _selectedIndex2 == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              coffeeController.pellets[index].text,
                              style: GoogleFonts.poppins(
                                  color: _selectedIndex2 == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Product Details",
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(
                height: 10,
              ),
              Text(
                "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit. ",
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Rating and Reviews",
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("4.4",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFC000),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 120,
                          child: Text(
                            "923 Ratings and 257 Reviews ",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 100,
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: ReviewChart(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Erric Hoffman",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    "05- oct 2020",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xFFFFC000),
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.2",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas  ",
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 0.4,
                width: double.infinity,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ben cline",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    "05- oct 2020",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xFFFFC000),
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.2",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas  ",
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Get.to(DeliveryScreen());
          firstFunction();
          // cartController.addProductStack(DealsModel.deals[widget.index],);
          // cartController.addProductStack2(AllProductModel.allproducts[widget.index],);
          // Check if the item is an instance of ModelClass2

          // cartController.addProductStack(DealsModel.deals[widget.index],);

          // cartController.addProductStack2(AllProductModel.allproducts[widget.index],);

        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: appPadding),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              "Add to cart",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
  void firstFunction()async{
    cartController.addProductStack(DealsModel.deals[widget.index],);
    // await secondFunction();
  }
  Future<void> secondFunction() async{
    cartController.addProductStack2(AllProductModel.allproducts[widget.index],);
  }
  // void addToCart(dynamic product)  {
  //   // Check if the item is an instance of ModelClass1
  //   if (cartController is DealsModel) {
  //     // Add the item to the cart if it meets the conditions
  //     cartController.addProductStack(DealsModel.deals[widget.index],);
  //   }
  //
  //   // Check if the item is an instance of ModelClass2
  //   else if (cartController is AllProductModel) {
  //     // Add the item to the cart if it meets the conditions
  //     cartController.addProductStack(AllProductModel.allproducts[widget.index],);
  //   }
  // }
}
