//
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:medtech/views/pages/no_internet_screen/no_internet.dart';
// import 'package:medtech/views/pages/splash/splash_screen.dart';
//
// class NoInternetController extends GetxController {
//   var hasInternet = true.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     checkInternet();
//   }
//
//   Future<void> checkInternet() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       Get.to(NoInternetScreen());
//     } else {
//       Get.to(SplashScreen());
//     }
//     // var connectivityResult = await Connectivity().checkConnectivity();
//     // if (connectivityResult == ConnectivityResult.none) {
//     //   hasInternet.value = false;
//     // }
//   }
// }