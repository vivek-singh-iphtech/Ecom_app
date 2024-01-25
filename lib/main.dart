import 'package:ecom_app/responsive/responsive_layout.dart';
import 'package:ecom_app/views/screens/HomePage.dart';
import 'package:ecom_app/views/shared/common_screen.dart';
import 'package:ecom_app/views/shared/mobile_common_screen.dart';
import 'package:flutter/material.dart';

import 'views/screens/ProductsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
     
      routes: {
        '/products': (context) => const ProductsPage(),
        // Add more routes as needed
      },
      home: Responsive.isDesktop(context)?CommonScreen(body: const HomePage()):MobileCommonScreen(),
    );
  }
}

