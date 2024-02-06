import 'package:first_flutter_vscode/pages/home_page.dart';
import 'package:first_flutter_vscode/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  
  const BottomBar({
    super.key,
    
    });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  int selectedIndex = 0;

  //  create list of screens

  static final List<Widget> _NavScreens = <Widget>[
    HomePage(), 
    SearchScreen()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _NavScreens.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            padding: EdgeInsets.all(4),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
