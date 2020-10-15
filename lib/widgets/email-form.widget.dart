import 'package:flutter/material.dart';

class EmailFormWidget extends StatelessWidget {
  var controller = new TextEditingController();

  EmailFormWidget({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "E-mail",
          labelStyle: TextStyle(
            color: Colors.white38,
            fontWeight: FontWeight.w400,
          ),
        ),
        validator: (value) {
          if (value.isEmpty)
            return "Campo obrigatório";
          else if (!(value.contains(regex)))
            return "E-mail inválido";
          else
            return null;
        },
        style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: "Big Shoulders Display"),
      ),
    );
  }
}
