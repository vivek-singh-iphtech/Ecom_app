import 'package:ecom_app/views/shared/common_screen.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({ Key? key }) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      body: Container(
        child: Text('products'),
      ),
    );
  }
}