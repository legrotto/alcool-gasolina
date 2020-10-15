import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  var text = "";
  bool focus;
  var controller = new TextEditingController();

  TextFormWidget({
    @required this.text,
    @required this.focus,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        autofocus: focus,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.white38,
            fontWeight: FontWeight.w400,
          ),
        ),
        validator: (value) {
          return (value.isEmpty) ? "Campo obrigatório" : null;
        },
        style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: "Big Shoulders Display"),
      ),
    );
  }
}
