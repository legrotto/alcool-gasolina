import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  var text = "";
  Function func;
  Icon icon;

  MenuButtonWidget({
    @required this.text,
    @required this.func,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(60),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontFamily: "Big Shoulders Display",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: SizedBox(
                  child: icon,
                  height: 28,
                  width: 28,
                ),
              )
            ],
          ),
          onPressed: func,
        ),
      ),
    );
  }
}
