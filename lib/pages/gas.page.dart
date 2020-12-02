import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project01_combustivel/model/gas.dart';

class GasPage extends StatefulWidget {
  @override
  _GasPageState createState() => _GasPageState();
}

class _GasPageState extends State<GasPage> {
  var db = FirebaseFirestore.instance;

  List<Combustiveis> combustiveis = List();

  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    listen?.cancel();
    listen = db.collection("combustiveis").snapshots().listen((res) {
      setState(() {
        combustiveis =
            res.docs.map((e) => Combustiveis.fromMap(e.data(), e.id)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Últimos preços dos combustíveis",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: "Big Shoulders Display",
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder<QuerySnapshot>(
          stream: db.collection("combustiveis").snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Erro de conexão.'),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView.builder(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    itemCount: combustiveis.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage("assets/images/combustivel.png"),
                          ),
                          title: Text(
                            combustiveis[index].nome,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "Big Shoulders Display",
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                          subtitle: Text(
                            combustiveis[index].preco,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "Big Shoulders Display",
                              fontSize: 20,
                            ),
                          ),
                          dense: true,
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              db
                                  .collection("combustiveis")
                                  .doc(combustiveis[index].id)
                                  .delete();
                            },
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      );
                    });
            }
          }),
    );
  }
}
