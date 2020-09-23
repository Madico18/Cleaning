import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/cart_item_model.dart';
import '../screens/catalog_screen.dart';

class CartOrderItem extends StatefulWidget {
  final String id;
  final String itemUuid;
  final String itemName;
  final String image;
  final String description;
  final String unitType;
  final int unitTime;
  final String unitPrice;
  final int quantity;
  final String cartItemKey;

  CartOrderItem(
    this.id,
    this.itemUuid,
    this.itemName,
    this.image,
    this.description,
    this.unitPrice,
    this.unitTime,
    this.unitType,
    this.quantity,
    this.cartItemKey,
  );

  @override
  _CartOrderItemState createState() => _CartOrderItemState();
}

class _CartOrderItemState extends State<CartOrderItem> {
  String imageUrlTransform(String url) {
    String newUrl = url.substring(22, url.length);

    print(widget.image);
    print(imageUrl + newUrl);

    return newUrl;
  }

  bool _isCounter = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.topLeft,
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
                      alignment: Alignment.topLeft,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: ImageIcon(
                          AssetImage("assets/images/help.png"),
                          color: Color(0xFFB0B3BC),
                        ),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                    height: 250.0,
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topRight,
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        237, 239, 246, 1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(8.0),
                                                      bottomLeft:
                                                          Radius.circular(8.0),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.close),
                                                  padding:
                                                      const EdgeInsets.all(0),
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
                        icon: Icon(Icons.close),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.topRight,
                        color: Color(0xFFB0B3BC),
                        onPressed: () {
                          cart.removeItem(widget.cartItemKey);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListTile(
            leading: Image.network(imageUrl + imageUrlTransform(widget.image)),
            title: Text(
              widget.itemName,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Срок чистки/${widget.unitTime} дня',
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
                            _isCounter = true;
                            cart.addItem(
                                widget.cartItemKey,
                                widget.itemUuid,
                                widget.itemName,
                                widget.image,
                                widget.description,
                                widget.unitType,
                                widget.unitTime,
                                widget.unitPrice);
                          },
                        ),
                        widget.quantity == 0
                            ? SizedBox(
                                width: 0,
                              )
                            : Text('${widget.quantity}'),
                        !_isCounter
                            ? SizedBox(
                                width: 0,
                              )
                            : IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  if (widget.quantity > 0)
                                    cart.removeItem(widget.cartItemKey);
                                },
                              ),
                      ],
                    ),
                    Text('${widget.unitPrice} тг'),
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
