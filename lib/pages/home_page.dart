import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // --- Dieser selektierte Index ist dazu da, die untere Navigationsleiste zu steuern ---
  int _selectedIndex = 0;

  // Diese Methode wird den selektierten Index ändern, wenn der Nutter auf einen anderen Tab klickt
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Seiten, die wir anzeigen lassen wollen, wenn der Nutzer auf einen Tab klickt
  final List<Widget> _pages = [
    // Shop übersichtsseite
    const ShopPage(),

    // Einkaufskorbseite
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),

      // ------------ SEITENLEISTE ------------
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/headerlogo.png',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                // HOME SEITE
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                ),

                // ----- ABOUT SEITE ---
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: Text(
                      'About us',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                  ),
                ),

                // ----- AGB SEITE ---
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: Text(
                      'AGB',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(
                      Icons.note_alt,
                      color: Colors.white,
                    ),
                  ),
                ),

                
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
