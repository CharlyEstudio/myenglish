import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:myenglish/components/inputs/email.input.dart';
import 'package:myenglish/components/inputs/password.input.dart';
import 'package:myenglish/controllers/sesions.controller.dart';
import 'package:myenglish/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final SessionController _cont = SessionController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _cont.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 140.0, bottom: 20.0),
                width: 250.0,
                child: Lottie.asset('assets/json/register.json'),
              ),
              emailInput(_cont),
              passwordInput(_cont),
              _buttonRegister(),
              _buttonCancel()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
      child: ElevatedButton(
        onPressed: () {
          _cont.register(context);
        },
        child: const Text('Registrarse'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.symmetric(vertical: 15.0)),
      ),
    );
  }

  Widget _buttonCancel() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
      child: ElevatedButton(
        onPressed: () {
          _cont.goToLoginPage(context);
        },
        child: const Text('Iniciar Sesión'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColorDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.symmetric(vertical: 15.0)),
      ),
    );
  }
}
