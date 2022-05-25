import 'package:april_shop_dress/services/constants.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class Products with ChangeNotifier {


  final List<Product> listProducts = [
    Product(
      id: "a1",
      title: "Santa`s hat",
      description: "Fabric, clean, red",
      status: "Yangi",
      discount: "10% CHEGIRMA",
      price: 9.90,
      image: "assets/images/shapka_u_ded_moroza.png",
      boxColor: AppColors.redColor.withOpacity(0.7),
      textColor: AppColors.redColor,
      gradientColor: AppColors.redColor,
      isSelectedStatus: true,
      isSelectedDiscount: false,
    ),
    Product(
      id: "a2",
      title: "Perchatki",
      description: "Perchatka u ded moroza made in USA",
      status: "Yangi",
      discount: "20% CHEGIRMA",
      price: 11.15,
      image: "assets/images/perchatki_u_ded_moroza.png",
      boxColor: AppColors.tealColor.withOpacity(0.7),
      textColor: AppColors.tealColor,
      gradientColor: AppColors.tealColor,
      isSelectedStatus: false,
      isSelectedDiscount: true,
    ),
    Product(
      id: "a3",
      title: "Sapog",
      description: "Sapog u ded moroza made in Russia",
      status: "Yangi",
      discount: "15% CHEGIRMA",
      price: 12.30,
      image: "assets/images/sapog1.png",
      boxColor: AppColors.deepPurpleAccentColor.withOpacity(0.7),
      textColor: AppColors.deepPurpleAccentColor,
      gradientColor: AppColors.deepPurpleAccentColor,
      isSelectedStatus: true,
      isSelectedDiscount: true,
    ),
    Product(
      id: "a4",
      title: "Kolokolchik",
      description: "Perchatki u Ded moroza",
      status: "Yangi",
      discount: "5% CHEGIRMA",
      price: 15.00,
      image: "assets/images/kolokolchik.png",
      boxColor: AppColors.pinkColor.withOpacity(0.7),
      textColor: AppColors.pinkColor,
      gradientColor: AppColors.pinkColor,
      isSelectedStatus: false,
      isSelectedDiscount: true,
    ),
    Product(
      id: "a5",
      title: "Yolochka ",
      description: "Lesnaya yolochka",
      status: "Yangi",
      discount: "10% CHEGIRMA",
      price: 20.25,
      image: "assets/images/yolochka1.png",
      boxColor: AppColors.greenColor.withOpacity(0.7),
      textColor: AppColors.greenColor,
      gradientColor: AppColors.greenColor,
      isSelectedStatus: false,
      isSelectedDiscount: true,
    ),

    Product(
      id: "a6",
      title: "Igrushka",
      description: "Igrushka yolochka iz Italii",
      status: "Yangi",
      discount: "5% CHEGIRMA",
      price: 9.50,
      image: "assets/images/igrushki_yolochka.png",
      boxColor: AppColors.blueColor.withOpacity(0.7),
      textColor: AppColors.blueColor,
      gradientColor: AppColors.blueColor,
      isSelectedStatus: true,
      isSelectedDiscount: true,
    ),

    Product(
      id: "a7",
      title: "Naski",
      description: "Podarok ot Ded Moroza dlya detey",
      status: "Yangi",
      discount: "20% CHEGIRMA",
      price: 5.50,
      image: "assets/images/noski.png",
      boxColor: AppColors.greyColor.withOpacity(0.7),
      textColor: AppColors.greyColor,
      gradientColor: AppColors.greyColor,
      isSelectedStatus: true,
      isSelectedDiscount: false,
    ),
  ];

  Product findById(String productId){
    return listProducts.firstWhere((product) => product.id == productId);
  }
}