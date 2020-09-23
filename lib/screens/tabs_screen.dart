import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/categories_screen.dart';
import '../screens/order_screen.dart';
import '../screens/profile_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/main-page';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [
    CategoriesScreen(),
    ProfileScreen(),
    OrderScreen(),
  ];

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          unselectedItemColor: const Color.fromRGBO(156, 170, 185, 1),
          selectedItemColor: const Color.fromRGBO(6, 16, 39, 1),
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/clean.png"),
              ),
              title: const Text(
                'Прачечная',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/profile.png"),
              ),
              title: const Text(
                'Профиль',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/order.png"),
              ),
              title: const Text(
                'Корзина',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
