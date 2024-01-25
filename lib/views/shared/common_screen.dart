

// import 'package:ecom_app/responsive/responsive_layout.dart';
// import 'package:ecom_app/views/shared/bottom_nav.dart';
import 'package:flutter/material.dart';

import 'navbar.dart';
class CommonScreen extends StatefulWidget {
  final Widget body;

  CommonScreen({required this.body});

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Navbar(),
        automaticallyImplyLeading: false,
      ),
      // bottomNavigationBar: Responsive.isMobile(context)?const BottomNav():null,
      body:widget.body,
     
    );
  }
}
