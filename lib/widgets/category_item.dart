import 'package:flutter/material.dart';
import 'package:washing/constants.dart';
import 'package:washing/screens/catalog_screen.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final String uuid;

  CategoryItem(this.uuid, this.description, this.image, this.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(
            name.toUpperCase(),
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            description,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
          ),
          trailing: Image.network(imageUrl + image),
          onTap: () {
            Navigator.pushNamed(context, CatalogScreen.routeName, arguments: {
              'uuid': uuid,
            });
          },
        ),
      ),
    );
  }
}
