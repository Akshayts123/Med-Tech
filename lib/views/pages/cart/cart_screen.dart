import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medtech/views/pages/cart/widgets/cart_product.dart';
import 'package:medtech/views/pages/cart/widgets/cart_total.dart';

import '../../../controller/cart_controller.dart';

final cartController = Get.put(CartController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(onTap: (){
          Get.back();
        },child: Icon(Icons.arrow_back,color: Colors.black,)),
        title:  Text("Your cart" ,style: Theme.of(context).textTheme.titleSmall),
        elevation: 0,
      ),
      body: CartProducts(),
      bottomNavigationBar: CartTotal(),
    );
  }
}
