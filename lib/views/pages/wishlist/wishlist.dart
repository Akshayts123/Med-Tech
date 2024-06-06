import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/wishlist_controller.dart';

class WishlistPage extends StatelessWidget {
  final WishlistController wishlistController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: wishlistController.wishlistItems.length,
          itemBuilder: (context, index) {
            final item = wishlistController.wishlistItems[index];
            return ListTile(
              leading: Image.network(item.image),
              title: Text(item.text),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  wishlistController.removeFromWishlist(item);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
