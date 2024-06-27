import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, Map<String, dynamic>> cartItems = {};

  void addToCart(String productName, double productPrice) {
    if (cartItems.containsKey(productName)) {
      cartItems[productName]!['quantity'] = cartItems[productName]!['quantity'] + 1;
    } else {
      cartItems[productName] = {'quantity': 1, 'price': productPrice};
    }
    notifyListeners();
  }

  void removeFromCart(String productName, {bool removeCompletely = false}) {
    if (cartItems.containsKey(productName)) {
      if (removeCompletely || cartItems[productName]!['quantity'] == 1) {
        cartItems.remove(productName);
      } else {
        cartItems[productName]!['quantity'] = cartItems[productName]!['quantity'] - 1;
      }
      notifyListeners();
    }
  }

  String getImageName(String productName) {
    switch (productName) {
      case "Rolex Datejust bleu":
        return "1";
      case "Rolex  Wimbledon":
        return "2";
      case "Rolex Datejust green":
        return "3";
      case "Rolex Oyster Perpetual":
        return "4";
      default:
        return "1"; // Default image if no match is found
    }
  }

  double getTotal() {
    double total = 0.0;
    cartItems.forEach((productName, details) {
      total += details['price'] * details['quantity'];
    });
    return total;
  }

  void checkout() {
    cartItems.clear();
    notifyListeners();
  }
}
