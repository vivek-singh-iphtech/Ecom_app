import 'package:ecom_app/views/screens/CartPage.dart';
import 'package:ecom_app/views/screens/HomePage.dart';
import 'package:ecom_app/views/screens/ProductsPage.dart';
import 'package:ecom_app/views/screens/wishListPage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'navbar.dart';

class MobileCommonScreen extends StatelessWidget {
   MobileCommonScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

   @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Navbar(),
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          HomePage(),
          ProductsPage(),
          WishListPage(),
          CartPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 92, 119, 255),
        buttonBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        color: const Color.fromARGB(255, 255, 255, 255),
        height: 55,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          ),
          Icon(
            Icons.camera,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          ),
          Icon(
            Icons.person,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          ),
          Icon(
            Icons.phone,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          )
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
      ),
    );
  }
}
