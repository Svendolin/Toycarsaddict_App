import 'package:ecommerceapp/components/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Auto auf die Liste setzen
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // SUCCESS!!! den Benutzer benachrichtigen, Auto erfolgreich hinzugefügt
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Color.fromARGB(255, 8, 160, 54),
        title: Text(
          'Successfully added!',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'Check your car collection list',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search for a car...',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // --- MITTEILUNGS SECTION ---
          const MessageTile(),

          // --- FEATURE SECTION ---
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FEATURES of the week",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Color.fromARGB(255, 133, 128, 171)),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // HORIZONTAL durch die Liste gehen
              padding: const EdgeInsets.only(bottom: 0),
              itemCount: value.getShoeList().length, // Durch die ganze Liste gehen
              itemBuilder: (context, index) {
                // --- DAS INDIVIDUELLE AUTO AUS DER LISTE HOLEN  ---
                Shoe individualShoe = value.getShoeList()[index];

                // (!) WICHTIGER PFAD, wo wir die Informationen des Autos anzeigen
                return ShoeTile(
                  imagePath: individualShoe.imagePath,
                  shoeName: individualShoe.name,
                  price: individualShoe.price,
                  description: individualShoe.description,
                  onTap: () => addShoeToCart(individualShoe),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
