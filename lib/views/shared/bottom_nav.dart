import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecom_app/views/screens/HomePage.dart';
import 'package:ecom_app/views/screens/ProductsPage.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: _currentIndex,
      backgroundColor: Colors.blueGrey,
      buttonBackgroundColor: Colors.white,
      color: const Color.fromARGB(255, 255, 240, 219),
      height: 65,
      items: const <Widget>[
        Icon(
          Icons.home,
          size: 35,
          color: Colors.red,
        ),
        Icon(
          Icons.shop,
          size: 35,
          color: Colors.deepPurpleAccent,
        ),
        Icon(
          Icons.person,
          size: 35,
          color: Colors.green,
        ),
        Icon(
          Icons.phone,
          size: 35,
          color: Colors.blue,
        ),
      ],
      onTap: (index) {
        print('Tapped index: $index');
        setState(() {
          _currentIndex = index;
        });

        // Navigate to the selected screen based on the index
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProductsPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProductsPage()),
            );
            break;
          default:
            break;
        }
      },
    
    );
  }
}
