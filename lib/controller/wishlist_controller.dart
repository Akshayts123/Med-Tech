
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/items.dart';

class WishlistController extends  GetxController{
  RxBool isInWishlist = false.obs;
  RxList<DealsModel> _wishlistItems = <DealsModel>[].obs;

  List<DealsModel> get wishlistItems => _wishlistItems.toList();

  void addToWishlist(DealsModel item) {
    _wishlistItems.add(item);
  }

  void removeFromWishlist(DealsModel item) {
    _wishlistItems.remove(item);
  }
}