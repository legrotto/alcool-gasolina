import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:project01_combustivel/widgets/logo.widget.dart';
import 'package:project01_combustivel/widgets/submit-form.widget.dart';
import 'package:project01_combustivel/widgets/success.widget.dart';

class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var db = FirebaseFirestore.instance;

  Color _color = Colors.deepPurple;
  var _gasController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(
            milliseconds: 1200,
          ),
          color: _color,
          child: ListView(
            children: <Widget>[
              LogoWidget(),
              _completed
                  ? SuccessWidget(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitFormWidget(
                      gasController: _gasController,
                      alcController: _alcoolController,
                      busy: _busy,
                      submitFunc: calculate,
                    ),
            ],
          ),
        ));
  }

  updateAlcool() async {
    QuerySnapshot usr = await db
        .collection("combustiveis")
        .where('nome', isEqualTo: "Álcool")
        .get();

    if (usr.docs.isNotEmpty) {
      await db
          .collection("combustiveis")
          .doc(usr.docs.first.id)
          .update({"preco": _alcoolController.text});
    } else {
      db.collection("combustiveis").add({
        "nome": "Álcool",
        "preco": _alcoolController.text,
      });
    }
  }

  updateGasolina() async {
    QuerySnapshot usr = await db
        .collection("combustiveis")
        .where('nome', isEqualTo: "Gasolina")
        .get();

    if (usr.docs.isNotEmpty) {
      await db
          .collection("combustiveis")
          .doc(usr.docs.first.id)
          .update({"preco": _gasController.text});
    } else {
      db.collection("combustiveis").add({
        "nome": "Gasolina",
        "preco": _alcoolController.text,
      });
    }
  }

  Future calculate() {
    double alc = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gas =
        double.parse(_gasController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      updateAlcool();
      updateGasolina();

      setState(() {
        if (res >= 0.7) {
          db.collection("calculos").add({
            "combustivel": "gasolina",
            "preco": _gasController.text,
            "data": DateTime.now().toString(),
          });

          _resultText = "Compensa utilizar Gasolina!";
        } else {
          db.collection("calculos").add({
            "combustivel": "alcool",
            "preco": _gasController.text,
            "data": DateTime.now().toString(),
          });

          _resultText = "Compensa utilizar Álcool!";
        }

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _color = Colors.deepPurple;
      _alcoolController = new MoneyMaskedTextController();
      _gasController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
