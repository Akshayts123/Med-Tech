

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medtech/views/pages/home/home.dart';

import '../models/items.dart';

class HomeController extends  GetxController{

   List<IconsModel> category = [
    IconsModel(image: "assets/images/category1.svg", text: "Dental"),
    IconsModel(image: "assets/images/category2.svg", text: "Wellness"),
    IconsModel(image: "assets/images/category3.svg", text: "Homeo"),
    IconsModel(image: "assets/images/category4.svg", text: "Eye care"),
    IconsModel(image: "assets/images/category5.svg", text: "Skin care"),
    IconsModel(image: "assets/images/category1.svg", text: "Dental"),
    IconsModel(image: "assets/images/category2.svg", text: "Wellness"),
    IconsModel(image: "assets/images/category3.svg", text: "Homeo"),
    IconsModel(image: "assets/images/category4.svg", text: "Eye care"),
    IconsModel(image: "assets/images/category5.svg", text: "Skin care"),
  ];
   // List<DealsModel> deals = [
   //   DealsModel(image: "assets/images/prot1.png", text: "Accu-check Active Test Strip", price: '₹111', id: '1', count: 0),
   //   DealsModel(image: "assets/images/prot2.png", text: "Omron HEM-8712 BP Monitor", price: '₹123', id: '2', count: 0),
   //   DealsModel(image: "assets/images/prot3.png", text: "Accu-check Active Test Strip", price: '₹250', id: '3', count: 0),
   //   DealsModel(image: "assets/images/prot4.png", text: "Omron HEM-8712 BP Monitor", price: '₹345', id: '4', count: 0),
   //   DealsModel(image: "assets/images/prot5.png", text: "Accu-check Active Test Strip", price: "₹789", id: '5', count: 0),
   //   DealsModel(image: "assets/images/prot1.png", text: "Omron HEM-8712 BP Monitor", price: '₹123', id: '6', count: 0),
   //   DealsModel(image: "assets/images/prot2.png", text: "Accu-check Active Test Strip", price: '₹675', id: '7', count: 0),
   //   DealsModel(image: "assets/images/prot3.png", text: "Omron HEM-8712 BP Monitor", price: '₹564', id: '8', count: 0),
   //   DealsModel(image: "assets/images/prot4.png", text: "Accu-check Active Test Strip", price: '₹765', id: '9', count: 0),
   //   DealsModel(image: "assets/images/prot5.png", text: "Omron HEM-8712 BP Monitor", price: '₹231', id: '10', count: 0),
   // ];
   List<FeaturedModel> featured = [
     FeaturedModel(image: "assets/images/feat1.png", text: 'Himalaya Wellness'),
     FeaturedModel(image: "assets/images/feat2.png", text: 'Accu-Chek'),
     FeaturedModel(image: "assets/images/feat3.png", text: 'Vlcc'),
     FeaturedModel(image: "assets/images/feat4.png", text: 'Protinex'),
     FeaturedModel(image: "assets/images/feat5.png", text: 'Microsoft'),
     FeaturedModel(image: "assets/images/feat1.png", text: 'Himalaya Wellness'),
     FeaturedModel(image: "assets/images/feat2.png", text: 'Accu-Chek'),
     FeaturedModel(image: "assets/images/feat3.png", text: 'Vlcc'),
     FeaturedModel(image: "assets/images/feat4.png", text: 'Protinex'),
     FeaturedModel(image: "assets/images/feat5.png", text: 'Microsoft'),
   ];
   // List<DibeticModel> dibetic = [
   //   DibeticModel(image: "assets/images/diet1.png", text: 'Sugar Substitute'),
   //   DibeticModel(image: "assets/images/diet2.png", text: 'Juices & Vinegars'),
   //   DibeticModel(image: "assets/images/diet3.png", text: 'Vitamins Medicines'),
   //   DibeticModel(image: "assets/images/diet4.png", text: 'Sugar Substitute'),
   //   DibeticModel(image: "assets/images/diet5.png", text: 'Juices & Vinegars'),
   //   DibeticModel(image: "assets/images/diet1.png", text: 'Vitamins Medicines'),
   //   DibeticModel(image: "assets/images/diet2.png", text: 'Sugar Substitute'),
   //   DibeticModel(image: "assets/images/diet3.png", text: 'Juices & Vinegars'),
   //   DibeticModel(image: "assets/images/diet4.png", text: 'Vitamins Medicines'),
   //   DibeticModel(image: "assets/images/diet5.png", text: 'Sugar Substitute'),
   // ];
   // List<AllProductModel> allproducts = [
   //   AllProductModel(image: "assets/images/curve1.png", text: 'SALE', sugarimg: 'assets/images/sugar.png'),
   //   AllProductModel(image: "assets/images/curve2.png", text: '15% OFF', sugarimg: 'assets/images/sugar1.png'),
   //   AllProductModel(image: "assets/images/curve1.png", text: 'SALE', sugarimg: 'assets/images/sugar2.png'),
   //   AllProductModel(image: "assets/images/curve2.png", text: '15% OFF', sugarimg: 'assets/images/sugar3.png'),
   //   AllProductModel(image: "assets/images/curve1.png", text: 'SALE', sugarimg: 'assets/images/sugar4.png'),
   //   AllProductModel(image: "assets/images/curve2.png", text: '15% OFF', sugarimg: 'assets/images/sugar.png'),
   //   AllProductModel(image: "assets/images/curve1.png", text: 'SALE', sugarimg: 'assets/images/sugar1.png'),
   //   AllProductModel(image: "assets/images/curve2.png", text: '15% OFF', sugarimg:  'assets/images/sugar2.png'),
   //   AllProductModel(image: "assets/images/curve1.png", text: 'SALE', sugarimg: 'assets/images/sugar3.png'),
   //   AllProductModel(image: "assets/images/curve2.png", text: '15% OFF', sugarimg: 'assets/images/sugar4.png'),
   // ];
   List<PelletsModel> pellets = [
     PelletsModel(text: "500 pellets"),
     PelletsModel(text: "110 pellets"),
     PelletsModel(text: "300 pellets"),
   ];
   List<Color> colors2 = [
     Colors.pink,
     Colors.green,
     Colors.orange,
     Colors.indigo,
     Colors.black,
     Colors.pink,
     Colors.green,
     Colors.orange,
     Colors.indigo,
     Colors.black,
   ];
   List<Color> colors = [
     Colors.red,
     Colors.lightGreen,
     Colors.yellowAccent,
     Colors.blue,
     Colors.black12,
     Colors.red,
     Colors.lightGreen,
     Colors.yellowAccent,
     Colors.blue,
     Colors.black12,
   ];
}