import 'package:ecom_app/models/products_models.dart';
import 'package:ecom_app/providers/wishlist_providers.dart';
import 'package:ecom_app/responsive/responsive_layout.dart';
import 'package:ecom_app/views/shared/common_screen.dart';

import 'package:ecom_app/views/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  
  @override
  void initState()
  {
    super.initState();
    Provider.of<WishList>(context,listen: false).getCartToPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
       
       body: Responsive(mobile: _mobileWishListPage(),desktop: _desktopWishlistPage()),
   );
  }

  void _navigateToProductPage(param0) {}
  
  _desktopWishlistPage() {
   return CommonScreen(
     body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Consumer<WishList>(
                builder: (context, favList, child) {
                  return ListView.builder(
                      itemCount: favList.wishList.length,
                      itemBuilder: ((context, index) {
                        Products? product = favList.wishList[index];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                              tileColor: Color.fromARGB(255, 243, 250, 254),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onTap: () {
                                _navigateToProductPage(product);
                              },
                              leading: CachedNetworkImage(
                                alignment: Alignment.center,
                                imageUrl: product!.image!,
                                height: 50.0,
                              ),
                              title: Text(
                                product?.title ?? 'null problem',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                'Price: \$${product?.price.toStringAsFixed(2) ?? '0.00'}' ??
                                    'null problem',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 14,
                                ),
                              ),
                              trailing: Consumer<WishList>(
                                  builder: (context, favorite, _) => IconButton(
                                        icon: Icon(
                                          favorite.isFav(product?.id)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Color.fromARGB(195, 255, 0, 0),
                                          size: 28,
                                        ),
                                        onPressed: () {
                                          Provider.of<WishList>(context,
                                                  listen: false)
                                              .toggle(product.id);
     
                                          WishList favcartlist =
                                              Provider.of<WishList>(context,
                                                  listen: false);
     
                                          if (favorite.isFav(product.id)) {
                                            favcartlist.addToWishList(product);
                                          } else {
                                            favcartlist
                                                .removeFromWishList(product);
                                          }
                                        },
                                      ))),
                        );
                      }));
                },
              )),
   );
  }
  
  _mobileWishListPage() {
    return Padding(
            padding: EdgeInsets.all(10.0),
            child: Consumer<WishList>(
              builder: (context, favList, child) {
                return ListView.builder(
                    itemCount: favList.wishList.length,
                    itemBuilder: ((context, index) {
                      Products? product = favList.wishList[index];
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                            tileColor: Color.fromARGB(255, 243, 250, 254),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              _navigateToProductPage(product);
                            },
                            leading: CachedNetworkImage(
                              alignment: Alignment.center,
                              imageUrl: product!.image!,
                              height: 50.0,
                            ),
                            title: Text(
                              product?.title ?? 'null problem',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              'Price: \$${product?.price.toStringAsFixed(2) ?? '0.00'}' ??
                                  'null problem',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                            trailing: Consumer<WishList>(
                                builder: (context, favorite, _) => IconButton(
                                      icon: Icon(
                                        favorite.isFav(product?.id)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Color.fromARGB(195, 255, 0, 0),
                                        size: 28,
                                      ),
                                      onPressed: () {
                                        Provider.of<WishList>(context,
                                                listen: false)
                                            .toggle(product.id);

                                        WishList favcartlist =
                                            Provider.of<WishList>(context,
                                                listen: false);

                                        if (favorite.isFav(product.id)) {
                                          favcartlist.addToWishList(product);
                                        } else {
                                          favcartlist
                                              .removeFromWishList(product);
                                        }
                                      },
                                    ))),
                      );
                    }));
              },
            ));
  }
}
