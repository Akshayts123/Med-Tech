class IconsModel {
  final String image;
  final String text;
  IconsModel({
    required this.image,
    required this.text,
  });
}

class DealsModel {
  final String id;
  final String image;
  final String text;
  late final int count;
  final double price;
  DealsModel({
    required this.count,
    required this.id,
    required this.price,
    required this.image,
    required this.text,
  });
  static List<DealsModel> deals = [
    DealsModel(
        image: "assets/images/prot1.png",
        text: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    DealsModel(
        image: "assets/images/prot2.png",
        text: "Omron HEM-8712 BP Monitor",
        price: 123,
        id: '2',
        count: 0),
    DealsModel(
        image: "assets/images/prot3.png",
        text: "Accu-check Active Test Strip",
        price: 250,
        id: '3',
        count: 0),
    DealsModel(
        image: "assets/images/prot4.png",
        text: "Omron HEM-8712 BP Monitor",
        price: 345,
        id: '4',
        count: 0),
    DealsModel(
        image: "assets/images/prot5.png",
        text: "Accu-check Active Test Strip",
        price: 789,
        id: '5',
        count: 0),
    DealsModel(
        image: "assets/images/prot1.png",
        text: "Omron HEM-8712 BP Monitor",
        price: 123,
        id: '6',
        count: 0),
    DealsModel(
        image: "assets/images/prot2.png",
        text: "Accu-check Active Test Strip",
        price: 675,
        id: '7',
        count: 0),
    DealsModel(
        image: "assets/images/prot3.png",
        text: "Omron HEM-8712 BP Monitor",
        price: 564,
        id: '8',
        count: 0),
    DealsModel(
        image: "assets/images/prot4.png",
        text: "Accu-check Active Test Strip",
        price: 765,
        id: '9',
        count: 0),
    DealsModel(
        image: "assets/images/prot5.png",
        text: "Omron HEM-8712 BP Monitor",
        price: 231,
        id: '10',
        count: 0),
  ];
}

class FeaturedModel {
  final String image;
  final String text;

  FeaturedModel({
    required this.image,
    required this.text,
  });
}

class DibeticModel {
  final String image;
  final double? price;
  final String text;
  DibeticModel({
    required this.image,
    required this.text,
    this.price,
  });
  static List<DibeticModel> dibetic = [
    DibeticModel(
        image: "assets/images/diet1.png", text: 'Sugar Substitute', price: 123),
    DibeticModel(
        image: "assets/images/diet2.png",
        text: 'Juices & Vinegars',
        price: 123),
    DibeticModel(
        image: "assets/images/diet3.png",
        text: 'Vitamins Medicines',
        price: 123),
    DibeticModel(
        image: "assets/images/diet4.png", text: 'Sugar Substitute', price: 123),
    DibeticModel(
        image: "assets/images/diet5.png",
        text: 'Juices & Vinegars',
        price: 123),
    DibeticModel(
        image: "assets/images/diet1.png",
        text: 'Vitamins Medicines',
        price: 123),
    DibeticModel(
        image: "assets/images/diet2.png", text: 'Sugar Substitute', price: 123),
    DibeticModel(
        image: "assets/images/diet3.png",
        text: 'Juices & Vinegars',
        price: 123),
    DibeticModel(
        image: "assets/images/diet4.png",
        text: 'Vitamins Medicines',
        price: 123),
    DibeticModel(
        image: "assets/images/diet5.png", text: 'Sugar Substitute', price: 123),
  ];
}

class AllProductModel {
  final String id;
  final String image;
  final String sugarimg;
  late final int count;
  final double price;
  final String text1;
  final String text;
  AllProductModel({
    required this.image,
    required this.id,
    required this.count,
    required this.price,
    required this.text1,
    required this.sugarimg,
    required this.text,
  });
  static List<AllProductModel> allproducts = [
    AllProductModel(
        image: "assets/images/curve1.png",
        text: 'SALE',
        sugarimg: 'assets/images/sugar.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve2.png",
        text: '15% OFF',
        sugarimg: 'assets/images/sugar1.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve1.png",
        text: 'SALE',
        sugarimg: 'assets/images/sugar2.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve2.png",
        text: '15% OFF',
        sugarimg: 'assets/images/sugar3.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve1.png",
        text: 'SALE',
        sugarimg: 'assets/images/sugar4.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve2.png",
        text: '15% OFF',
        sugarimg: 'assets/images/sugar.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve1.png",
        text: 'SALE',
        sugarimg: 'assets/images/sugar1.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve2.png",
        text: '15% OFF',
        sugarimg: 'assets/images/sugar2.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve1.png",
        text: 'SALE',
        sugarimg: 'assets/images/sugar3.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
    AllProductModel(
        image: "assets/images/curve2.png",
        text: '15% OFF',
        sugarimg: 'assets/images/sugar4.png',
        text1: "Accu-check Active Test Strip",
        price: 111,
        id: '1',
        count: 0),
  ];
}

class PelletsModel {
  final String text;
  PelletsModel({
    required this.text,
  });
}
