import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:washing/screens/categories_screen.dart';
import 'package:washing/screens/tabs_screen.dart';
import '../helpers/auth_helper.dart';
import '../helpers/categories_helper.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _login = '';
  String _password = '';
  bool passwordVisible = false;

  Future<void> _submit() async {
    String _key;

    try {
      _key = await Provider.of<Auth>(context, listen: false)
          .logIn(_login, _password);

      if (_key != '1') Navigator.pushNamed(context, TabsScreen.routeName);
      print(_key);
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Войти',
            style: Theme.of(context).textTheme.headline1,
          ),
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _loginController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(237, 242, 255, 1),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(92, 106, 121, 1),
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline3,
                          labelText: 'Логин',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _login = value;
                            print(_login);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _passController,
                        obscureText: passwordVisible ? false : true,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(92, 106, 121, 1),
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline3,
                          labelText: 'Пароль',
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color.fromRGBO(92, 106, 121, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hoverColor: Color.fromRGBO(238, 238, 238, 1),
                          focusColor: Color.fromRGBO(238, 238, 238, 1),
                          fillColor: Color.fromRGBO(238, 238, 238, 1),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                            print(_password);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
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
                    'Войти',
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
