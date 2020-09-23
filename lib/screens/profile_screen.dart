import 'package:flutter/material.dart';
import 'package:washing/screens/auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'demo',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      child: FlatButton(
                        child: Text(
                          'Выйти',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromRGBO(255, 80, 80, 1)),
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              AuthScreen.routeName,
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
