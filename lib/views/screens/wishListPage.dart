import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({ Key? key }) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text('wishlist'),
    );
  }
}