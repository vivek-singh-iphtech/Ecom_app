import 'package:ecom_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecom_app/controllers/products_controllers.dart';
import 'package:ecom_app/models/products_models.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  final ProductController products = ProductController();

   

  @override
  void initState() {
    super.initState();
    products.fetchProductsData();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: products.fetchProductsData(),
        builder: (context, AsyncSnapshot<List<Products>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            List<Products>? prod = snapshot.data;

           int maxProduct =6;

            return LayoutBuilder(builder: (context, Constraints) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                 
                  itemCount: prod!=null ? prod.length.clamp(0, maxProduct):0,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 800 ? 3 : 2,
                    childAspectRatio: Responsive.isMobile(context)?MediaQuery.of(context).size.aspectRatio * 3 / 2:1,
                  ),
                  itemBuilder: (context, index) => 
                  
                  ListItem(prod?[index]),
                ),
              );
            });
          }
        });
  }
}

class ListItem extends StatelessWidget {
  final Products? product;
  const ListItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        
        CachedNetworkImage(
          imageUrl: product!.image!,
          height: Responsive.isMobile(context)?130:200,
          // fit: BoxFit.cover,
        ),
        SizedBox(height: 4), // Add spacing between the image and text
    
        // Truncate title to 2 words
        Text(
          _truncateTitle(product?.title ?? 'test1', 2),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold, 
          ),
        ),
    
        SizedBox(height: 4), // Add spacing between the title and rating
    
        // Display price
        Text(
          'Price: \$${product?.price.toStringAsFixed(2) ?? '0.00'}',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.green, // Customize the color of the price
          ),
        ),
    
        SizedBox(height: 4), 
         Text(
              'Rating: ${product?.rating?.rate ?? 0.0} (${product?.rating?.count ?? 0} reviews)',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey, // Customize the color of the rating
              ),),
    
               SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                // Handle the "Add to Cart" button press
                // You can implement the logic to add the product to the cart here
              },
              child: Text('Add to Cart'),
            ),
    
    
        // Display rating and add to cart butto
      ],
    );
  }

  String _truncateTitle(String title, int words) {
    List<String> titleWords = title.split(' ');
    if (titleWords.length <= words) {
      return title;
    } else {
      return titleWords.sublist(0, words).join(' ');
    }
  }

}
