import 'package:ecom_app/providers/cart_providers.dart';
import 'package:ecom_app/views/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final data;
  const ProductDetails({super.key, required this.data});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final String addToCart = 'Add To Cart';
  final String removeFromCart = 'Remove From Cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Navbar(),
        ),
        bottomNavigationBar: Consumer<Cart>(
          builder: (context, cart, _) => BottomAppBar(
            color: Colors.black,
            height: 50.0,
            child: TextButton(
              child: Center(
                child: Text(
                  cart.isCart(widget.data?.id) ? removeFromCart : addToCart,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Provider.of<Cart>(context, listen: false)
                    .toggle(widget.data?.id);

                Cart cartList = Provider.of<Cart>(context, listen: false);
                

                if(cart.isCart(widget.data?.id))
                {
                  cartList.addToCart(widget.data);
                  
                }
                else
                {
                  cartList.removeFromCart(widget.data);
                 
                }
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.data.image,
                    height: 300,
                    // fit: BoxFit.cover,
                  ),

                  const SizedBox(
                    height: 14,
                  ),

                  Text(
                    widget.data?.title ?? 'test1',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                      height: 4), // Add spacing between the title and rating

                  // Display price
                  Text(
                    'Price: \$${widget.data?.price.toStringAsFixed(2) ?? '0.00'}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.green, // Customize the color of the price
                    ),
                  ),

                  Text(
                    widget.data?.description ?? 'test1',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
