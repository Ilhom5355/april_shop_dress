import 'package:april_shop_dress/pages/cart_list_item.dart';
import 'package:april_shop_dress/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/carts.dart';

class OrdersCard extends StatelessWidget {
  static const routeName = "/ordersCard";

  const OrdersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Savatcha",
          style: AppFontFamily.aBeeZeeFonts(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 20, right: 10),
            child: Text(
              "Tozalash",
              style: AppFontFamily.domineFonts(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  "Sizning buyurtmangiz",
                  style: AppFontFamily.merriweatherFonts(
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart.items.values.toList()[index];
                    return CartListItem(
                      productId: cart.items.keys.toList()[index],
                      image: cartItem.image,
                      title: cartItem.title,
                      price: cartItem.price,
                      quantity: cartItem.quantity,
                      boxColor: cartItem.boxColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Umumiy summa:",
                  style: AppFontFamily.domineFonts(fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$ ${cart.totalPrice.toStringAsFixed(2)}",
                  style: AppFontFamily.domineFonts(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Xarid qilish \$ ${cart.totalPrice.toStringAsFixed(2)}",
                    style: GoogleFonts.lora(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

