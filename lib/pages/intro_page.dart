import 'package:ecommerceapp/pages/home_page.dart';
import 'package:flutter/material.dart';

// --- EINFüHRUNGSEITE ---
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ------------------------ logo ------------------------
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'lib/images/LogoV2.jpg',
                  height: 240,
                ),
              ),

              const SizedBox(height: 48),

              // ------------------------ title ------------------------

              const Text('ALL ABOUT 1/64 SCALED MASTERPIECES',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),

                const SizedBox(height: 24), // Some more empty  space

              // ------------------------ SubTitle ------------------------
              const Text(
                'Which are the brand new releases for today?',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // ------------------------ Start now button ------------------
              // Als GestureContainer gewrapt, um auf die Home Page zu weiterzuleiten beim Taklick
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Discover Now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
