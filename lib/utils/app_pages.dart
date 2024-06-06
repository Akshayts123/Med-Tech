import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../controller/splash_controller.dart';
import '../views/pages/bindings/bindings.dart';
import '../views/pages/cart/cart_screen.dart';
import '../views/pages/home/home.dart';
import '../views/pages/no_internet_screen/internet_screen.dart';
import '../views/pages/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: "/splash_screen",
      page: () => const SplashScreen(),
      binding: BaseBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/home",
      page: () => HomeScreen(),
      binding: BaseBindings(),
    ),
    // GetPage(
    //   name: "/internet_screen",
    //   page: () =>  InternetCheck(),
    //   transition: Transition.fadeIn,
    // ),
  ];
}