import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier{

  // List of shoes for sale

  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAX', 
      price: '236', 
      imagePath: 'lib/images/shoe_2.jpg', 
      description: 'latest signature shoe.'),

    Shoe(
      name: 'Giant Build', 
      price: '246', 
      imagePath: 'lib/images/shoe_3.jpg', 
      description: 'latest build shoe.'),

    Shoe(
      name: 'Strong build', 
      price: '350', 
      imagePath: 'lib/images/shoe_4.jpg', 
      description: 'latest strong build shoe.'),

    Shoe(
      name: 'Olard-war', 
      price: '300', 
      imagePath: 'lib/images/shoe_5.jpg', 
      description: 'latest olard-war shoe .'),
  ];
  


  // list of items in user cart

  List<Shoe> userCart =[];



  // Get list of shoes for sales 

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart

  List<Shoe> getUserCart() {
    return userCart;
  }


  // add items to cart

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}