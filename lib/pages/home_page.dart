import 'package:flutter/material.dart';
import 'package:shoe_store/components/bottom_nav_bar.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// This selected index is to control the bottom nav bar
int _selectedIndex = 0;


// this method will update our selected index
// when the user taps on the bottom bar

void navigateBottomBar(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

// pages to display
final List<Widget>_pages = [
// shop page
  const ShopPage(),

  // cart page

  const CartPage(),

];







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // google nav bar
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              // open drawer
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
              icon: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Icon(Icons.menu,
                color: Colors.black,),
              ),
              );
          }
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // loogo

            Column(
              children: [
                DrawerHeader(child: Image.asset('lib/images/nikel.png'),
                ),

                Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey[800],
                ),
                ),

                // other pages

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Home', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  
                  ),
                  Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text('About', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  
                  ),

              ],
            ),

          // Logout
          Expanded(child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout', style: TextStyle(
                  color: Colors.white
                ),)
              ),
            ),

          ))
          ],

        ),
      ),


      
      body: _pages[_selectedIndex],
    );
  }
}