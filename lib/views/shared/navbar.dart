import 'package:ecom_app/responsive/responsive_layout.dart';
import 'package:ecom_app/views/shared/nav_item.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final String Home = 'Home';
  final String Products = 'Products';
  final String wishlist = 'wishlist';
  final String Cart = 'Cart';

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: _mobileNavBar(), desktop: _desktopNavBar());
  }

  //Navbar for desktop
  Widget _desktopNavBar() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('ShopIt'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(title: Home, route: '/'),
              const SizedBox(width: 8),
              NavItem(title: Products, route: '/products'),
              const SizedBox(width: 8),
              NavItem(title: wishlist, route: '/wishlist'),
              const SizedBox(width: 8),
              NavItem(title: Cart, route: '/cart'),
          ],
        )
      ]),
    );
  }

  //Navbar for mobile
  Widget _mobileNavBar() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('ShopIt'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(title: wishlist, route: '',),
            const SizedBox(width: 8),
            NavItem(title: Cart, route: '',),
          ],
        )
      ]),

      

    );
  }


  
}
