import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  final String imagePath;
  final String shoeName;
  final String price;
  final String description;
  Function()? onTap;
  ShoeTile({
    super.key,
    required this.imagePath,
    required this.shoeName,
    required this.price,
    required this.onTap,
    required this.description,
  });

  // --- AUTOKARTEN DESIGN (Für FEATURED SECTION) ---
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 320,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // --- CAR PICTURE, Autobild zum einbetten ---
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(imagePath),
          ),

          // --- BESCHREIBUNG DAZU ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),

          // --- NAME UND HERSTELLER (TEXTE IN DEN KARTEN) ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoeName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Cost / Value: \$$price',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 128, 8, 8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // --- SCHALTFLÄCHE ZUM HINZUFÜGEN AUF DIE LISTE (+ Symbol) ---
              GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 128, 8, 8),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
