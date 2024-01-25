import 'package:ecom_app/views/widgets/Homepage/carousel.dart';
import 'package:ecom_app/views/widgets/Homepage/categories.dart';
import 'package:ecom_app/views/widgets/Homepage/featured_products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../responsive/responsive_layout.dart';
import '../shared/common_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(mobile: _mobileHomePage(), desktop: _desktopHomePage()),
    );
  }

  // homepage for desktop
  Widget _desktopHomePage() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Carousel(),
          ),
           Padding(
            padding: EdgeInsets.all(14.0),
            child: Categories(),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: FeaturedProducts(),
          ),
          SizedBox(height: 16.0), // Add some space at the bottom
        ],
      ),
    );
  }

  // homepage for mobile
  Widget _mobileHomePage() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Carousel(),
          ),
            Padding(
            padding: EdgeInsets.all(14.0),
            child: Categories(),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: FeaturedProducts(),
          ),
          SizedBox(height: 16.0), // Add some space at the bottom
        ],
      ),
    );
  }
}
