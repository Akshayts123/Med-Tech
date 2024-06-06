// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../splash/splash_screen.dart';
// import 'no_internet.dart';
//
// class InternetCheck extends StatefulWidget {
//   @override
//   _InternetCheckState createState() => _InternetCheckState();
// }
//
// class _InternetCheckState extends State<InternetCheck> {
//   bool _isConnected = true;
//
//   @override
//   void initState() {
//     super.initState();
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       setState(() {
//         _isConnected = (result != ConnectivityResult.none);
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _isConnected ? SplashScreen() : NoInternetScreen();
//   }
// }