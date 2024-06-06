
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:medtech/controller/no_internet_controller.dart';
import 'package:medtech/utils/app_pages.dart';
import 'package:medtech/utils/app_routes.dart';
import 'package:medtech/views/pages/no_internet_screen/no_internet.dart';
import 'package:medtech/views/pages/splash/splash_screen.dart';
import 'utils/theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      // theme: Themes.light,
      // darkTheme: Themes.dark,
      // themeMode: ThemeService().theme,
      theme: lightTheme,
      darkTheme: lightTheme,
      themeMode: ThemeMode.system,
      title: 'Billion Dollar App',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: AppPages.routes,
      initialRoute: Routes.SPLASH,
      // initialRoute: Routes.SPLASH,
    );

  }
}