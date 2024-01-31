import 'package:ecom_app/views/screens/CartPage.dart';
import 'package:ecom_app/views/screens/HomePage.dart';
import 'package:ecom_app/views/screens/ProductsPage.dart';
import 'package:ecom_app/views/screens/wishListPage.dart';
import 'package:ecom_app/views/shared/common_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'nav_item.dart';
import 'navbar.dart';

class MobileCommonScreen extends StatefulWidget {
  MobileCommonScreen({Key? key}) : super(key: key);

  @override
  State<MobileCommonScreen> createState() => _MobileCommonScreenState();
}

class _MobileCommonScreenState extends State<MobileCommonScreen> {
  final PageController _pageController = PageController();
 final String wishlist = 'wishlist';
  final String Cart = 'Cart';
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: _mobileNavBar(),
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Push the corresponding named route based on the index
        },
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
        index: _currentIndex,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          ),
          Icon(
            Icons.shop,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          ),
          Icon(
            Icons.favorite,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          ),
          Icon(
            Icons.account_box,
            size: 35,
            color: Color.fromARGB(255, 92, 119, 255),
          )
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
  
  _mobileNavBar() {
     return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('ShopIt'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(title: wishlist, route: '',),
            const SizedBox(width: 8),
             IconButton(
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Color.fromARGB(195, 0, 0, 0),
                          size: 28,
                        ),
                        onPressed: () {
                          navigateToCartPage();
                        },
             ),
          ],
        )
      ]),

      

    );
  }
  
  void navigateToCartPage() {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
  }
}
