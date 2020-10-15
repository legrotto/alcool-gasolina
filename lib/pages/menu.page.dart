import 'package:flutter/material.dart';
import 'package:project01_combustivel/pages/calculate.page.dart';
import 'package:project01_combustivel/pages/login.page.dart';
import 'package:project01_combustivel/widgets/logo.widget.dart';
import 'package:project01_combustivel/widgets/menu-button.widget.dart';

import 'about.page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: <Widget>[
            LogoWidget(),
            MenuButtonWidget(
              text: "Sobre",
              icon: Icon(
                Icons.info,
                color: Theme.of(context).primaryColor,
              ),
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
            ),
            MenuButtonWidget(
              text: "Álcool ou Gasolina?",
              icon: Icon(
                Icons.ev_station,
                color: Theme.of(context).primaryColor,
              ),
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculatePage(),
                  ),
                );
              },
            ),
            MenuButtonWidget(
              text: "Sair",
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).primaryColor,
              ),
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
