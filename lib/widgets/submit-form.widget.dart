import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.widget.dart';
import 'calculate-button.widget.dart';

class SubmitFormWidget extends StatelessWidget {
  var gasController = new MoneyMaskedTextController();
  var alcController = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitFormWidget({
    @required this.gasController,
    @required this.alcController,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: InputWidget(
              label: "Gasolina",
              controller: gasController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: InputWidget(
              label: "Álcool",
              controller: alcController,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          CalculateButtonWidget(
            busy: busy,
            func: submitFunc,
            invert: false,
            text: "CALCULAR",
          ),
        ],
      ),
    );
  }
}
