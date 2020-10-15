import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project01_combustivel/widgets/custom-appbar.widget.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Informações do projeto:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                fontFamily: "Big Shoulders Display",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Olá seja bem-vindo!",
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                fontFamily: "Big Shoulders Display",
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Este é o meu primeiro aplicativo em Flutter!",
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                fontFamily: "Big Shoulders Display",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ele tem como objetivo permitir que os usuários calculem qual combustível compensa mais utilizar, álcool ou gasolina.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                fontFamily: "Big Shoulders Display",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Veja o que compensa mais e aproveite!",
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                fontFamily: "Big Shoulders Display",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.8),
            ),
            Text(
              "Versão:",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.withOpacity(0.8),
                fontFamily: "Big Shoulders Display",
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "1.0.3",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey.withOpacity(0.8),
                fontFamily: "Big Shoulders Display",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
