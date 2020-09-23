import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';
import '../models/cart_item_model.dart';
import '../helpers/orders_helper.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/order';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                'Корзина',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            FlatButton(
              child: Text(
                'Очистить',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                cart.clear();
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  return CartOrderItem(
                    cart.items.values.toList()[index].itemUuid,
                    cart.items.values.toList()[index].itemName,
                    cart.items.values.toList()[index].description,
                    cart.items.values.toList()[index].image,
                    cart.items.values.toList()[index].id,
                    cart.items.values.toList()[index].unitPrice,
                    cart.items.values.toList()[index].unitTime,
                    cart.items.values.toList()[index].unitType,
                    cart.items.values.toList()[index].quantity,
                    cart.items.keys.toList()[index],
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 15.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Общая сумма ${cart.totalAmount}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          '${cart.items.length} вещи',
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 343.0,
                    height: 43.0,
                    margin: const EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                        elevation: 5,
                        color: Color.fromRGBO(67, 118, 251, 1),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          'Оформить',
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false).addOrder(
                              cart.items.values.toList(), cart.totalAmount);

                          cart.clear();
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        'Заказ успешно оформлен',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              content: Center(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: ButtonTheme(
                                  minWidth: 203.0,
                                  height: 46.0,
                                  child: RaisedButton(
                                    elevation: 5,
                                    color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: Text(
                                      'OK',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
