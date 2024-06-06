import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import '../../../../controller/cart_controller.dart';
import '../../../../models/items.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products.length > 0
          ? ListView.builder(
              itemCount: controller.products.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CartProductCard(
                  controller: controller,
                  product: controller.products.keys.toList()[index],
                  quantity: controller.products.values.toList()[index],
                  index: index,
                );
              })
          : SizedBox(
              height: 800,
              child: Center(
                child: Column(
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
                    Text(
                      "Whoops",
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your cart is empty!",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CartProductCard extends StatefulWidget {
  final CartController controller;
  final  product;
  final int quantity;
  final int index;
  const CartProductCard(
      {Key? key,
      required this.index,
      required this.controller,
      required this.product,
      required this.quantity,
      })
      : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2.0,
                blurRadius: 2.0,
              )
            ],
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      widget.controller.deleteProduct(widget.product);
                      widget.controller.deleteProduct2(widget.product);
                    },
                    child: Image.asset(
                      "assets/images/close.png",
                      fit: BoxFit.contain,
                      height: 25,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.controller.removeProduct(widget.product);
                          widget.controller.removeProduct2(widget.product);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          size: 30,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        "${widget.quantity}",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.controller
                              .addProduct(widget.product);
                          widget.controller
                              .addProduct2(widget.product);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFf6f6f8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Image.asset(
                              widget.product.image,
                              fit: BoxFit.contain,
                              height: 70,
                              width: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 170,
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                widget.product.text,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                "bottle of 500 pellets",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "₹${widget.product.price.toString() ?? 111}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(height: 15,),
            // Container(
            //   height: 1,
            //   width: double.infinity,
            //   color: Colors.grey.shade300,
            // ),
          ],
        ),
      ),
    );
  }
}
