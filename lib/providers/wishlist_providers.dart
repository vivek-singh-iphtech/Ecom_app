
import 'package:ecom_app/models/products_models.dart';
import 'package:flutter/material.dart';

class WishList extends ChangeNotifier {

     Map<int,bool> fav = {};

     List<Products> wishList = [];

     Map<int, bool> get getIsFav => fav;

     List<Products> get getWishList => wishList;

     bool isFav(int? id)
     {
      return fav[id] ?? false;
     }

     void addToWishList(Products? product)
     {
        wishList.add(product!);
        notifyListeners();
     }

      void removeFromWishList(Products? product)
     {
        wishList.remove(product);
        notifyListeners();
     }

     void toggle(int? id)
     {
         fav[id ?? -1] = !(fav[id ?? -1] ?? false);
         notifyListeners();
     }
}