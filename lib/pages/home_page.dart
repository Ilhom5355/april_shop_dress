import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/carts.dart';
import '../services/constants.dart';
import 'orders_card.dart';
import 'tab_controller_page.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // callDrawer();
          },
          icon: SvgPicture.asset("assets/icons/menu2.svg"),
        ),
        title: Text(
          "Rexar Shop",
          style: AppFontFamily.merriweatherFonts(),
        ),
        actions: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 3),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OrdersCard(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
              ),
              Positioned(
                top: 10,
                right: 8,
                child: Consumer<Cart>(
                  builder: (ctx, cart, child) {
                    return Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          cart.itemCount().toString(),
                          style: const TextStyle(
                              fontSize: 10, color: AppColors.whiteColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: AppSize.paddingSize20, top: AppSize.paddingSize10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sevimli buyumingizni tanlang!",
                    style: AppFontFamily.libreBaskervilleFonts(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Text(
                  "Ajoyib har bir buyumda mujassam",
                  style: AppFontFamily.domineFonts(),
                ),
              ],
            ),
          ),
          TabControllerPage(),
        ],
      ),
    );
  }
// Drawer callDrawer() {
//   return const Drawer(
//     backgroundColor: AppColors.amberColor,
// );
//  }
}
