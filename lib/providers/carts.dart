import 'package:april_shop_dress/models/cart_item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

// Mahsulotlar sonini olish +++++++++++++++++++++++++++++++++++++++++

  int itemCount() {
    return _items.length;
  }

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // Savatchadagi narxni qo`shish ^^^^^^^^^^

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

// Savatchaga mahsulot qo`shish --------------------------------------------

  void addToCart(String productId, title, image, double price, Color boxColor) {
    // Savatchada mahsulot bormi Agar productId деган калит булса
    if (items.containsKey(productId)) {
      // ... sonini ko`paytir // Agar savatchada bo`lsa
      _items.update(
          productId,
          (currentProduct) => CartItem(
                id: currentProduct.id,
                title: currentProduct.title,
                quantity: currentProduct.quantity + 1,
                price: currentProduct.price,
                image: currentProduct.image,
                boxColor: currentProduct.boxColor,
              ));
    } else {
      // Agar savatchada mahsulot bo`lmasa
      // yangi mahsulot savaychaga qo`shilmoqda
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: UniqueKey().toString(),
          title: title,
          quantity: 1,
          price: price,
          image: image,
          boxColor: boxColor,
        ),
      );
    }
    notifyListeners();
  }

  // Mahsulotni 1 ga kamaytirish -------------------------------------------
  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (currentProduct) => CartItem(
          id: currentProduct.id,
          title: currentProduct.title,
          quantity: currentProduct.quantity-1,
          price: currentProduct.price,
          image: currentProduct.image,
          boxColor: currentProduct.boxColor,
        ),
      );
      notifyListeners();
    }
  }
}

 //------------------------------------------------------------------------