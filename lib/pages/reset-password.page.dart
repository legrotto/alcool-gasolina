import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project01_combustivel/widgets/submit-button.widget.dart';
import 'package:project01_combustivel/widgets/email-form.widget.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
        color: Colors.deepOrange,
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
                          func: () {
                            if (formKey.currentState.validate()) {
                              showInfoFlushbar(context);
                              controller.clear();
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
      message: 'Verifique sua caixa de entrada e recupere sua senha.',
      icon: Icon(
        Icons.email,
        size: 28,
        color: Colors.lightBlue,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
