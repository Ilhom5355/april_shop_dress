import 'package:april_shop_dress/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'more_products.dart';


class AllProductsPage extends StatelessWidget {

  const AllProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context);
    return Scaffold(
      body: GridView.builder(
        itemCount: product.listProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          //final product = listProducts[index];
          return MoreProducts(product: product.listProducts[index]);

        },
      ),
    );
  }
}


