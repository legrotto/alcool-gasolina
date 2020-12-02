import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project01_combustivel/widgets/submit-button.widget.dart';
import 'package:project01_combustivel/widgets/email-form.widget.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var db = FirebaseFirestore.instance;

  var formKey = GlobalKey<FormState>();
  var controller = new TextEditingController();

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
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Colors.deepPurple,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                              "assets/images/reset-password-icon.png"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Big Shoulders Display",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Informe seu e-mail que te enviaremos um link com as instruções para restauração da sua senha.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Big Shoulders Display",
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        EmailFormWidget(
                          controller: controller,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SubmitButtonWidget(
                          text: "Enviar",
                          func: () async {
                            if (formKey.currentState.validate()) {
                              QuerySnapshot usr = await db
                                  .collection("usuarios")
                                  .where('email', isEqualTo: controller.text)
                                  .get();

                              if (usr.docs.isEmpty) {
                                showErrorFlushbar(context);
                                controller.clear();
                              } else {
                                await db.collection("usuarios").doc(usr.docs.first.id).update({
                                  "senha": "123456",
                                });

                                showInfoFlushbar(context);
                                controller.clear();
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showInfoFlushbar(BuildContext context) async {
    Flushbar(
      title: 'E-mail enviado com sucesso!',
      message: 'Verifique sua caixa de entrada e utilize sua nova senha.',
      icon: Icon(
        Icons.email,
        size: 28,
        color: Colors.lightBlue,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showErrorFlushbar(BuildContext context) {
    Flushbar(
      title: 'Não Encontrado',
      message: 'Usuário não encontrado',
      icon: Icon(
        Icons.account_circle,
        size: 28,
        color: Colors.redAccent,
      ),
      leftBarIndicatorColor: Colors.red.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
