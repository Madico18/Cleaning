import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:washing/widgets/catalog_item.dart';
import '../helpers/catalog_helper.dart';
import '../helpers/categories_helper.dart';
import '../models/category_model.dart';
import '../models/item_model.dart';

class CatalogScreen extends StatefulWidget {
  static const routeName = '/catalog-screen';

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Item> _items = [];
  List<Item> _loadedItems = [];
  List<ItemCategory> _categories = [];

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    _items = Provider.of<Catalog>(context, listen: false).catalog;
    _loadedItems =
        _items.where((el) => el.categoryUuid == routeArgs['uuid']).toList();
    _categories = Provider.of<Categories>(context, listen: false).categories;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          _categories
              .firstWhere((el) => el.uuid == routeArgs['uuid'])
              .categoryName,
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: _loadedItems.length,
          itemBuilder: (context, index) {
            final item = _loadedItems[index];
            return CatalogItem(item);
          }),
    );
  }
}
