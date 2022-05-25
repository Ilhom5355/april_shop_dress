import 'package:april_shop_dress/pages/all_orders.dart';
import 'package:april_shop_dress/pages/orders_card.dart';
import 'package:april_shop_dress/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/carts.dart';

class SelectedProducts extends StatefulWidget {
  final Product product;



  static final routeName = "/selectedProducts";

  const SelectedProducts({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<SelectedProducts> createState() => _SelectedProductsState();
}

class _SelectedProductsState extends State<SelectedProducts> {

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    // final products = Provider.of<Product>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(color: widget.product.boxColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 55, right: 10),
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.keyboard_arrow_down)),
                    ),
                  ],
                ),
                Container(
                  height: 160,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.product.image),
                    ),
                    //color: Colors.blue
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 175,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor.withOpacity(0.3),
                        ),
                        child: InkWell(
                          onTap: () {
                            //cart.removeSingleItem(productId);
                            //cart.removeSingleItem;
                          },
                          child: const Icon(
                            (Icons.remove),
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteColor,
                        ),
                        child: Center(
                          child: Text(
                            "${0}",
                            style: GoogleFonts.lora(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor.withOpacity(0.3),
                        ),
                        child: InkWell(
                          radius: 0.0,
                          onTap: () {},
                          child: const Icon(
                            (Icons.add),
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 320),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                color: AppColors.whiteColor),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.title,
                            style: GoogleFonts.lora(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.product.status,
                            style: GoogleFonts.lora(
                                fontSize: 15,
                                color: widget.product.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            widget.product.description,
                            style: GoogleFonts.lora(
                              fontSize: 15,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          widget.product.toggleFavorite();
                        },
                        icon: Icon(widget.product.isFavorite
                                ? Icons.favorite_border
                                : Icons.favorite,
                            color: widget.product.boxColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.product.image),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Umumiy narxi:",
                            style: GoogleFonts.lora(
                              color: AppColors.blackColor.withOpacity(0.9),
                            ),
                          ),
                          Text(
                            //"\$ ${product.price.toStringAsFixed(2)}",
                            "\$ ${cart.totalPrice.toStringAsFixed(2)}",
                            style: GoogleFonts.lora(
                                fontSize: 20,
                                color: widget.product.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamed(OrdersCard("/ordersCard"));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const OrdersCard(),
                            ),
                          );
                        },
                        child: Container(
                          // margin: const EdgeInsets.only(right: 20),
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const AllOrders()));
                                },
                                child: Container(
                                  width: 140,
                                  height: 20,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 16,
                                      ),
                                      Text(
                                        "Savatchaga borish",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
