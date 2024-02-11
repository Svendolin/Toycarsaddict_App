import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

// --- Abschnitt des Warenkorbs (Listenprinzip. Nutzen wir hier aber als Liste) ---

// --- Produktdefinition ---
class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // --- Funktion zum Entfernen eines Produkts aus dem Warenkorb ---
  void removeItemFromCart() {
    // remove it!
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);

    // --- NUTZER INFORMIEREN, DASS DAS PRODUKT GELÖSCHT WURDE ---
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Color.fromARGB(255, 126, 0, 0),
        title: Text(
          'Removed from your list!',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        content: Text(
          '',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          widget.shoe.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$${widget.shoe.price}'),
        leading: Image.asset(widget.shoe.imagePath),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => removeItemFromCart(),
        ),
      ),
    );
  }
}
