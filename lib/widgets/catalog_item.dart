import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/cart_item_model.dart';
import '../screens/catalog_screen.dart';
import '../models/item_model.dart';

class CatalogItem extends StatefulWidget {
  final Item item;
  CatalogItem(this.item);

  @override
  _CatalogItemState createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
  int _counter = 0;

  bool _isCounter = false;

  String imageUrlTransform(String url) {
    String newUrl = url.substring(22, url.length);

    print(newUrl);

    return newUrl;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Align(
                  child: Container(
                    width: 26.0,
                    height: 26.0,
                    padding: const EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 239, 246, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                    ),
                  ),
                  alignment: Alignment.topRight,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage("assets/images/help.png"),
                      color: Color(0xFFB0B3BC),
                    ),
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.topRight,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                                height: 250.0,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment(1, -0.4),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, right: 10.0),
                                        child: Stack(
                                          fit: StackFit.loose,
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          children: <Widget>[
                                            Container(
                                              width: 26.0,
                                              height: 26.0,
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    237, 239, 246, 1),
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(8.0),
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.close),
                                              padding: const EdgeInsets.all(0),
                                              alignment: Alignment.topRight,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 0),
                                      child: Text(
                                        'Химчистка рубашек',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Text(
                                        'А вот так это делается просто берешь и делаешь и делать можно много а можно вообще не делать или делать и делать или не делать и не делать или делать но не сильно',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                    },
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading:
                Image.network(imageUrl + imageUrlTransform(widget.item.image)),
            title: Text(
              widget.item.itemName,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Срок чистки/${widget.item.unitTime} дня',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            setState(() {
                              _counter++;
                            });

                            if (_counter > 0) {
                              _isCounter = true;
                            }

                            cart.addItem(
                                widget.item.itemUuid,
                                widget.item.itemUuid,
                                widget.item.itemName,
                                widget.item.image,
                                widget.item.description,
                                widget.item.unitType,
                                widget.item.unitTime,
                                widget.item.unitPrice);
                          },
                        ),
                        !_isCounter
                            ? SizedBox(
                                width: 0,
                              )
                            : Text('$_counter'),
                        !_isCounter
                            ? SizedBox(
                                width: 0,
                              )
                            : IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    _counter--;
                                  });

                                  if (_counter == 0) {
                                    _isCounter = false;
                                  }
                                },
                              ),
                      ],
                    ),
                    Text('${widget.item.unitPrice} тг'),
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, CatalogScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
