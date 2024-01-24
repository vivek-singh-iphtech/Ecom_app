import 'package:ecom_app/views/widgets/Homepage/carousel.dart';
import 'package:flutter/material.dart';

import '../shared/common_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
   Widget build(BuildContext context) {
    return CommonScreen(
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Carousel(),
          ),
        ],
      ),
    );
  }
}
