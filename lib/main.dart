import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project01_combustivel/pages/login.page.dart';

import 'pages/about.page.dart';
import 'pages/calculate.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Álcool ou Gasolina',
      initialRoute: '/login.page',
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/login.page': (context) => LoginPage(),
        '/calculate.page': (context) => CalculatePage(),
        '/sobre.page': (context) => AboutPage(),
      },
    );
  }
}
