import 'package:april_shop_dress/services/constants.dart';
import 'package:flutter/material.dart';

class AllOrders extends StatelessWidget {

  static final routeName = "/allOrders";

  const AllOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Buyurtmalar",
          style: AppFontFamily.domineFonts(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
