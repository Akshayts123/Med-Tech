import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/cart/widgets/total_widgets.dart';

import '../../../../controller/cart_controller.dart';
import '../cart_screen.dart';

class CartTotal extends StatelessWidget {
  final controller = Get.put(CartController());
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products.length > 0 ? Container(
        height: 230,
        padding:  EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payment Summary",
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: 10,
            ),
            TotalWidgets(
              headtotal: "Order Total",
              total: "₹${controller.total}",
            ),
            SizedBox(
              height: 5,
            ),
            TotalWidgets(
              headtotal: "Shipping",
              total: "Free",
            ),
            SizedBox(
              height: 5,
            ),
            TotalWidgets(
              headtotal: "Total Items",
              total: "${cartController.products.length}",
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "₹${controller.total}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            InkWell(
              onTap: () {
                // _formKey.currentState!.validate();
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Place Order @ ₹${controller.total}",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ): SizedBox(
        height: 800,
        child: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/emptycart.svg",
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Whoops",style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),),
            SizedBox(
              height: 10,
            ),
            Text("Your cart is empty!",style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500),)
          ],
        ),),
      ),
    );
  }
}
