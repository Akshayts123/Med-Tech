

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController{

  List<String> addresses = [
    "123 Main Street 456 Elm Street 789 Oak Street",
  ];
  Future<void> saveAddresses(List<String> addresses) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('addresses', addresses);
  }
  Future<List<String>> getAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final addresses = prefs.getStringList('addresses') ?? [];
    return addresses;
  }
}