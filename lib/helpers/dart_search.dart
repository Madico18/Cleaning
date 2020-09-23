import 'package:flutter/material.dart';
import '../helpers/catalog_helper.dart';
import '../widgets/catalog_item.dart';
import '../models/item_model.dart';

class DataSearch extends SearchDelegate<Catalog> {
  final List<Item> items;

  DataSearch(this.items);

  List<Item> _recentItems = [];

  @override
  String get searchFieldLabel => 'Поиск';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _recentItems = [];
    final suggestionList = query.isEmpty
        ? _recentItems
        : items
            .where((p) => p.itemName.toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final item = suggestionList[index];
        return CatalogItem(item);
      },
      itemCount: suggestionList.length,
    );
  }
}
