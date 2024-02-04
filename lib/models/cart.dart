import 'package:flutter/material.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier {
  // --- LISTE VON AUTOS, die in das Highligh müssen ---
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Mercedes AMG ONE',
      price: '30-40',
      imagePath: 'lib/images/Mercedes.png',
      description: 'The very first 1/64 scaled version of this car. Made by TPC, limited to just 999 units!',
    ),
    Shoe(
      name: 'Mitsubishi Evo IX Tokyo Drift',
      price: '30-35',
      imagePath: 'lib/images/Mitsubishi.png',
      description:
          'Sean\'s EVO IX from the movie Fast and Furious Tokyo Drift by SpeedGT is just legendary.',
    ),
    Shoe(
      name: 'Nissan Skyline GTR R34 HKS',
      price: '35-40',
      imagePath: 'lib/images/Nissan.png',
      description:
          'Timemicro\'s latest version of the R34 GTR with HKS livery and RB26 engine.',
    ),
    Shoe(
      name: 'Porsche 935 K3',
      price: '30-35',
      imagePath: 'lib/images/Porsche.png',
      description:
          'Tarmacworks finally released the legendary Porsche 935 K3 in Jägermeister Livery.',
    ),
  ];

  // --- Gesamtliste der Artikel im Warenkorb des Benutzers ---
  List<Shoe> userCart = [];

  // Liste der zu verkaufenden Artikel erhalten
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Warenkorb holen
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Artikel zum Warenkorb hinzufügen
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Artikel aus dem Warenkorb entfernen
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
