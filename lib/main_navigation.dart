import 'package:flutter/material.dart';
import 'package:newsly/features/bookmark/ui/bookmark_screen.dart';
import 'package:newsly/features/home/ui/home_screen.dart';
import 'package:newsly/features/discover/ui/screens/discover_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newsly/features/home/ui/widgets/circle_icon_button.dart';
import 'package:newsly/features/home/ui/widgets/newsly_logo.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static List<Widget> _buildScreens(BuildContext context) {
    return [
      const HomeScreen(),
      const DiscoverScreen(),
      const BookmarkScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const NewslyLogo(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                BlurCircleIconButton(
                  icon: Icons.search,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                BlurCircleIconButton(
                  icon: Icons.dark_mode_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: _buildScreens(context).elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black26,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).primaryColor,
              color: Colors.grey,
              tabs: [
                const GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                const GButton(
                  icon: Icons.language_rounded,
                  text: 'Discover',
                ),
                const GButton(
                  icon: Icons.bookmark_outlined,
                  text: 'Bookmarks',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
