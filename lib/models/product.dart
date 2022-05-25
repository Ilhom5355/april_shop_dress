import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String status; // holati
  final String discount; // chegirma
  final double price;
  final String image;
  final Color boxColor;
  final Color textColor;
  final Color gradientColor;
  final bool isSelectedStatus;
  final bool isSelectedDiscount;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.discount,
    required this.price,
    required this.image,
    required this.boxColor,
    required this.textColor,
    required this.gradientColor,
    this.isSelectedStatus = false,
    this.isSelectedDiscount = false,
    this.isFavorite = true,
  });


   // Like Button
  void toggleFavorite(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
