import 'package:get/get.dart';
import '../models/items.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  //FOR CART PAGE/////////////////////////////////////////////////////////////////
  void addProduct(DealsModel product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;

    }
  }
  void addProduct2(AllProductModel product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;

    }
  }

  //FOR ADD TO CART PAGE/////////////////////////////////////////////////////////////////
  void addProductStack(
    DealsModel product
  ) {
    if (_products.containsKey(product)) {
      // _products[product] += 1 > 2;

      Get.snackbar(
        "Already In Cart",
        "Your Product ${product.text} has added to cart",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    }
    else {
      _products[product] = 1;

      Get.snackbar(
        "Successfully Added To Cart",
        "Your Product ${product.text} has added to cart",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    }
  }
  void addProductStack2(
      AllProductModel product
      ) {
    if (_products.containsKey(product)) {
      // _products[product] += 1 > 2;

      Get.snackbar(
        "Already In Cart",
        "Your Product ${product.text} has added to cart",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    } else {
      _products[product] = 1;
      // _products[product2] = 1;
      Get.snackbar(
        "Successfully Added To Cart",
        "Your Product ${product.text} has added to cart",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    }
  }
  // void addProductStack(dynamic product) {
  //   // Check if the item is an instance of ModelClass1
  //   if (product is DealsModel) {
  //     // Add the item to the cart if it meets the conditions
  //     if (_products.containsKey(product)) {
  //       Get.snackbar(
  //         "Already In Cart",
  //         "Your Product ${product.text} has added to cart",
  //         snackPosition: SnackPosition.TOP,
  //         duration: const Duration(seconds: 2),
  //       );
  //     }
  //     else {
  //       _products[product] = 1;
  //
  //       Get.snackbar(
  //         "Successfully Added To Cart",
  //         "Your Product ${product.text} has added to cart",
  //         snackPosition: SnackPosition.TOP,
  //         duration: const Duration(seconds: 2),
  //       );
  //     }
  //   }
  //   // Check if the item is an instance of ModelClass2
  //   else if (product is AllProductModel) {
  //     // Add the item to the cart if it meets the conditions
  //     if (_products.containsKey(product)) {
  //       Get.snackbar(
  //         "Already In Cart",
  //         "Your Product ${product.text} has added to cart",
  //         snackPosition: SnackPosition.TOP,
  //         duration: const Duration(seconds: 2),
  //       );
  //     }
  //     else {
  //       _products[product] = 1;
  //
  //       Get.snackbar(
  //         "Successfully Added To Cart",
  //         "Your Product ${product.text} has added to cart",
  //         snackPosition: SnackPosition.TOP,
  //         duration: const Duration(seconds: 2),
  //       );
  //     }
  //   }
  // }

  //DELETE BUTTON/////////////////////////////////////////////////////////////////
  void deleteProduct(DealsModel product ) {
    if ((_products.containsKey(product) && _products[product] == 1)) {
      _products.remove(product);
    } else {
      _products.remove(product);
    }
  }
  void deleteProduct2(AllProductModel product) {
    if ((_products.containsKey(product) && _products[product] == 1)) {
      _products.remove(product);
    } else {
      _products.remove(product);
    }
  }

  //DECREASE QUANTITY/////////////////////////////////////////////////////////////////
  get products => _products;
  void removeProduct(DealsModel product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);

    } else {
      _products[product] -= 1;
    }
  }
  void removeProduct2(AllProductModel product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);

    } else {
      _products[product] -= 1;
    }
  }

  //PRICE TOTALS/////////////////////////////////////////////////////////////////
  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries.isNotEmpty
      ? _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2)
      : 0.0;
}
