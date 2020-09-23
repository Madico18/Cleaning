import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helpers/orders_helper.dart';
import 'screens/order_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/catalog_screen.dart';
import 'constants.dart';
import 'helpers/auth_helper.dart';
import 'helpers/categories_helper.dart';
import 'helpers/catalog_helper.dart';
import 'models/cart_item_model.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (context) => Catalog(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Cleaning',
        theme: ThemeData(
          backgroundColor: customColor,
          fontFamily: 'Museo Sans Cyrl',
          textTheme: TextTheme(
              headline1: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(23, 40, 81, 1),
              ),
              headline2: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(23, 40, 81, 1),
              ),
              headline3: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(176, 179, 188, 1),
              ),
              headline4: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(23, 40, 81, 1),
              ),
              headline5: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(23, 40, 81, 1),
              ),
              button: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              subtitle1: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(23, 40, 81, 1),
              )),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthScreen(),
        routes: {
          CatalogScreen.routeName: (context) => CatalogScreen(),
          CategoriesScreen.routeName: (context) => CategoriesScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          TabsScreen.routeName: (context) => TabsScreen(),
        },
      ),
    );
  }
}
