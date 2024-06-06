import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/controller/address_controller.dart';

import '../cart/order_placed.dart';
import 'delivery.dart';

final AddressController addressController = Get.put(AddressController());

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

List<Address> addresses = [
  Address(
      street: "123 Main St",
      city: "Anytown",
      state: "CA",
      postalCode: "12345",
      from: 'Home'),
  Address(
      street: "456 Oak St",
      city: "Sometown",
      state: "NY",
      postalCode: "67890",
      from: 'Office'),
  Address(
      street: "789 Maple Ave",
      city: "Othercity",
      state: "TX",
      postalCode: "24680",
      from: 'Other'),
];
Address? selectedAddress;
List<Payment> payments = [
  Payment(image: "assets/images/pay1.png", name: "Credit card"),
  Payment(image: "assets/images/pay2.png", name: "Paypal"),
  Payment(image: "assets/images/pay3.png", name: "Google pay"),
  Payment(image: "assets/images/pay4.png", name: "Apple pay"),
];
Payment? selectedPayments;

class _DeliveryScreenState extends State<DeliveryScreen> {
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
        title: Text("Checkout", style: Theme.of(context).textTheme.titleSmall),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("2 Items in your cart"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("TOTAL"),
                      Text(
                        "185.00",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Delivery Address",
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   child: FutureBuilder<List<String>>(
            //     future: addressController.getAddresses(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         final addresses = snapshot.data;
            //         return Container(
            //           height: 200,
            //           child: ListView.builder(
            //             itemCount: addressController.addresses.length,
            //             itemBuilder: (context, index) {
            //               final address = addresses![index];
            //               return ListTile(
            //                 title: Text(address),
            //               );
            //             },
            //           ),
            //         );
            //       } else {
            //         return CircularProgressIndicator();
            //       }
            //     },
            //   ),
            // ),
            Container(
              height: 220,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: RadioListTile(
                      activeColor: Theme.of(context).primaryColor,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                addresses[index].from,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${addresses[index].street}, ${addresses[index].city},",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${addresses[index].state} ${addresses[index].postalCode}",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/images/pencil.svg",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      value: addresses[index],
                      groupValue: selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value as Address?;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(AddAddressScreen());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "Add Address",
                        style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Payment method",
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5, color: Colors.grey)),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Theme.of(context).primaryColor,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            payments[index].image,
                            fit: BoxFit.cover,
                            height: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            payments[index].name,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      value: payments[index],
                      groupValue: selectedPayments,
                      onChanged: (value) {
                        setState(() {
                          selectedPayments = value as Payment?;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Get.to(DeliveryScreen());
          Get.to(OrderPlaced());
          // cartController.addProductStack(DealsModel.deals[widget.index],);
          // cartController.addProductStack(AllProductModel.allproducts[widget.index],);
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
              "Pay Now 185.00",
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
}

class Address {
  final String from;
  final String street;
  final String city;
  final String state;
  final String postalCode;

  Address(
      {required this.from,
      required this.street,
      required this.city,
      required this.state,
      required this.postalCode});
}

class Payment {
  final String image;
  final String name;

  Payment({
    required this.image,
    required this.name,
  });
}
