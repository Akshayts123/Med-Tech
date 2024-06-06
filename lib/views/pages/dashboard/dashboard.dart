import 'package:badges/badges.dart';
import 'package:flutter/material.dart'hide Badge;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../cart/cart_screen.dart';
import '../home/home.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../notification/notifi.dart';
import '../profile/profile.dart';
import '../whatsapp/full_payment.dart';
import '../whatsapp/otpless.dart';
class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const Notifi(),
       Container(),
      const CartScreen(),
      Profile(),
    ];
    final indexState = useState(0);
    final bottomState = useState(true);
    final controller = useScrollController();
    final location = useState('');

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: screens[indexState.value],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          fixedColor: Theme.of(context).primaryColor,
          selectedFontSize: 12,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // backgroundColor: Theme.of(context).primaryColor,
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: indexState.value,
          onTap: (e) {
            indexState.value = e;
            if (controller.position.pixels != 0.0) {
              controller.animateTo(
                0.0,
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              tooltip: "Home",

              icon: SvgPicture.asset(
                "assets/images/house.svg",
                fit: BoxFit.cover,
                color: Colors.grey,
              ),
              activeIcon: SvgPicture.asset(
                "assets/images/house.svg",
                fit: BoxFit.cover,
                color:Theme.of(context).primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Notification",
              icon: SvgPicture.asset(
                "assets/images/noti.svg",
                fit: BoxFit.cover,
                color: Colors.grey,
              ),
              activeIcon: SvgPicture.asset(
                "assets/images/noti.svg",
                fit: BoxFit.cover,
                color:Theme.of(context).primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Forum",
              icon:  SvgPicture.asset(
                "assets/images/plus.svg",
                fit: BoxFit.cover,
                color: Colors.grey,
              ),
              activeIcon:SvgPicture.asset(
                "assets/images/plus.svg",
                fit: BoxFit.cover,
                color:Theme.of(context).primaryColor,
              ),
              // activeIcon: iconAssetImage("assets/icons/cart.png"),
            ),
            BottomNavigationBarItem(
              label: "Inbox",
              icon:  Obx(
                    () => InkWell(
                  // onTap: () => Get.to(() => const CartScreen()),
                  child: Badge(
                    badgeContent: Text(
                      "${cartController.products.length}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    showBadge: cartController.products.length > 0,
                    position: BadgePosition.topEnd(top: -12, end: -7),
                    child: Image.asset(
                      "assets/images/cart.png",
                      color: Colors.grey,
                      width: 20,
                    ),
                  ),
                ),
              ),
              activeIcon: Obx(
                    () => InkWell(
                  // onTap: () => Get.to(() => const CartScreen()),
                  child: Badge(
                    badgeContent: Text(
                      "${cartController.products.length}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    showBadge: cartController.products.length > 0,
                    position: BadgePosition.topEnd(top: -12, end: -7),
                    child: Image.asset(
                      "assets/images/cart.png",
                      color: Theme.of(context).primaryColor,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: Image.asset(
                "assets/images/person.png",
                fit: BoxFit.cover,
                color: Colors.grey,
                height: 30,
              ),
              activeIcon: Image.asset(
                "assets/images/person.png",
                fit: BoxFit.cover,
                height: 30,
                color:Theme.of(context).primaryColor,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
