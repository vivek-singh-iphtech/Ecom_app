import 'package:ecom_app/models/products_models.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  Map<int, bool> cart = {};

 
  List<Products?> cartList = [];

  Map<int, bool> get getCart => cart;

  List<Products?> get getCartList => cartList;

  bool isCart(int? id) {
    return cart[id] ?? false;
  }

  void addToCart(Products? product) {
    // int existingProduct = cartList.indexWhere(
    //     (element) => element?.id == product?.id); //get exist index of product

    // if (existingProduct != -1) {
    //   cartList[existingProduct]?.incrementQuantity();
    // } else {
    //   cartList.add(product!);
    // }

    cartList.add(product!);

     
    notifyListeners();
  }

  void removeFromCart(Products? product) {
    cartList.removeWhere((element) => element?.id == product?.id);
    notifyListeners();
  }
 void incrementQuantity(Products? product) {
    product?.quantity++;
    notifyListeners();
  }

  void decrementQuantity(Products? product) {
    if (product!.quantity > 1) {
      product.quantity--;
      notifyListeners();
    }
  }

  void toggle(int? id) {
    cart[id ?? -1] = !(cart[id ?? -1] ?? false);
    notifyListeners();
  }
}
