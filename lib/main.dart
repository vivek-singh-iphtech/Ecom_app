import 'package:ecom_app/providers/wishlist_providers.dart';
import 'package:ecom_app/responsive/responsive_layout.dart';
import 'package:ecom_app/views/screens/HomePage.dart';
import 'package:ecom_app/views/screens/wishListPage.dart';
import 'package:ecom_app/views/shared/common_screen.dart';
import 'package:ecom_app/views/shared/mobile_common_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/screens/ProductsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      providers: [ //wrapping the widget by making the provider object
        ChangeNotifierProvider<WishList>(create: (_)=> WishList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/':(context) => Responsive.isDesktop(context) && kIsWeb
            ?  const HomePage()
            : MobileCommonScreen(),
          '/products': (context) => const ProductsPage(),
          '/wishlist': (context) => const WishListPage(),
          // Add more routes as needed
        },
        // home: Responsive.isDesktop(context)
        //     ?  const HomePage()
        //     : MobileCommonScreen(),
      ),
    );
  }
}
