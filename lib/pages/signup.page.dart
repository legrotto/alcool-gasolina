import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project01_combustivel/widgets/text-form.widget.dart';
import 'package:project01_combustivel/widgets/submit-button.widget.dart';
import 'package:project01_combustivel/widgets/email-form.widget.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var controllerNome = new TextEditingController();
  var controllerEmail = new TextEditingController();
  var controllerSenha = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.deepOrange,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 150,
                height: 150,
                alignment: Alignment(0.0, 1.15),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              TextFormWidget(
                text: "Nome",
                focus: true,
                controller: controllerNome,
              ),
              EmailFormWidget(
                controller: controllerEmail,
              ),
              TextFormWidget(
                text: "Senha",
                focus: false,
                controller: controllerSenha,
              ),
              SizedBox(
                height: 10,
              ),
              SubmitButtonWidget(
                text: "Cadastrar",
                func: () {
                  if (formKey.currentState.validate()) {
                    showInfoFlushbar(context);
                    controllerEmail.clear();
                    controllerNome.clear();
                    controllerSenha.clear();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    "Cancelar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Cadastrado!',
      message: 'Usuário cadastrado com sucesso',
      icon: Icon(
        Icons.check_circle,
        size: 28,
        color: Colors.lightGreen,
      ),
      leftBarIndicatorColor: Colors.green.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
