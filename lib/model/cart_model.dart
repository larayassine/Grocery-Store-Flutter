import 'package:flutter/material.dart';

class cartModel extends ChangeNotifier {
// list of items on sale
  final List _shopItems = [
    ["Apple", "4.00", "assets/images/apple.png", Colors.lime],
    ["Avocado", "10.00", "assets/images/avoca.jpg", Colors.lightGreen],
    ["Lemons", "2.00", "assets/images/lemons.png", Colors.yellow],
    ["Fraise", "3.00", "assets/images/Fraise.jpg", Colors.pink],
  ];

//list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  //add items to cart
void addItemToCart(int index){ 
  _cartItems.add(_shopItems[index]);
  notifyListeners();
}

  //remove items from cart

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total
  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}
