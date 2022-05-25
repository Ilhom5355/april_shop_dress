import 'package:april_shop_dress/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/carts.dart';
import 'selected_products.dart';

class MoreProducts extends StatelessWidget {

  final Product product;

  const MoreProducts({
    Key? key,
    required this.product
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SelectedProducts(product: product),
          ),
        );

       // Navigator.of(context).pushNamed(SelectedProducts.routeName);
        //Navigator.of(context).pushNamed(SelectedProducts.routeName, arguments: product.isFavorite);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 350,
        decoration: BoxDecoration(
          color: product.boxColor,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              product.gradientColor.withOpacity(0.4),
              product.gradientColor,
            ],
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  product.isSelectedDiscount
                      ? Container(
                          height: 26,
                          width: 125,
                          decoration: BoxDecoration(
                            color: product.boxColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              product.discount,
                              style: AppFontFamily.loraFonts(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.whiteColor,
                                  //fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  product.isSelectedStatus
                      ? Container(
                          height: 26,
                          width: 75,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              //bottomLeft: Radius.circular(20),
                              //topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              product.status,
                              style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: product.textColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              height: 240,
              width: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.image),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: GoogleFonts.lora(
                      fontSize: 25,
                      color: product.textColor,
                    ),
                  ),
                  Text(
                    product.description,
                    style: GoogleFonts.lora(
                        fontSize: 15, color: product.textColor),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${product.price.toStringAsFixed(2)}",
                          style: GoogleFonts.lora(
                            color: AppColors.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cart.addToCart(
                              product.id,
                              product.title,
                              product.image,
                              product.price,
                              product.boxColor
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.5),
                                shape: BoxShape.circle),
                            child: const Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
