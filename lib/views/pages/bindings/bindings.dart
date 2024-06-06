import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:medtech/controller/address_controller.dart';
import 'package:medtech/controller/home_controller.dart';
import '../../../controller/cart_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../../controller/wishlist_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() async {
    Get.put(SplashScreenViewModel());
    Get.put(HomeController());
    Get.put(CartController());
    Get.put(WishlistController());
    Get.put(AddressController());
  }
}