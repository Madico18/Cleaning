import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/categories_helper.dart';
import '../helpers/catalog_helper.dart';
import '../models/category_model.dart';
import '../widgets/category_item.dart';
import '../helpers/dart_search.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories-screen';
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  TextEditingController _controller = TextEditingController();

  String _query;
  List<ItemCategory> _itemCategories = [];

  @override
  void initState() {
    super.initState();

    getCategoriesAndItems();
  }

  Future<void> getCategoriesAndItems() async {
    try {
      await Provider.of<Categories>(context, listen: false).getData();
      await Provider.of<Catalog>(context, listen: false).getData();
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).backgroundColor,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 343.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Найти вещь',
                        labelStyle: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(176, 179, 188, 1)),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        prefixStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(176, 179, 188, 1),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _query = value;
                        });
                      },
                      onTap: () {
                        showSearch(
                            context: context,
                            delegate: DataSearch(
                                Provider.of<Catalog>(context, listen: false)
                                    .catalog));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<Categories>(
                    builder: (context, data, ch) {
                      _itemCategories = data.categories;
                      return ListView.builder(
                        itemCount: _itemCategories.length,
                        itemBuilder: (context, index) {
                          final category = _itemCategories[index];
                          return CategoryItem(
                              category.uuid,
                              category.categoryDescription,
                              category.categoryImage,
                              category.categoryName);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
