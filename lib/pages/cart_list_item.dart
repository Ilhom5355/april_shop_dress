import 'package:april_shop_dress/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/carts.dart';

class CartListItem extends StatelessWidget {
  final String productId;
  final String title;
  final String image;
  final double price;
  final int quantity;
  final Color boxColor;

  const CartListItem({
    Key? key,
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: boxColor,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  boxColor.withOpacity(0.4),
                  boxColor,
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(title, style: GoogleFonts.lora(fontWeight: FontWeight.bold)),
          subtitle: Text("\$ ${price}", style: GoogleFonts.lora()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  cart.removeSingleItem(productId);
                },
                icon: const Icon(Icons.remove, color: AppColors.blackColor),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: Center(
                  child: Text('$quantity'),
                ),
              ),
              IconButton(
                onPressed: () {
                  cart.addToCart(productId, title, image, price, boxColor);
                },
                icon: const Icon(Icons.add, color: AppColors.blackColor),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
