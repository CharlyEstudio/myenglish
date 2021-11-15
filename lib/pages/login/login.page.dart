import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:myenglish/components/inputs/email.input.dart';
import 'package:myenglish/components/inputs/password.input.dart';
import 'package:myenglish/controllers/sesions.controller.dart';
import 'package:myenglish/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              margin: const EdgeInsets.only(top: 120.0, bottom: 50.0),
              width: 250.0,
              child: Lottie.asset('assets/json/learning.json'),
            ),
            emailInput(_cont),
            passwordInput(_cont),
            _buttonSignIn(),
            _rowDontHaveAccount(),
          ],
        ),
      ),
    ));
  }

  Widget _buttonSignIn() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: ElevatedButton(
        onPressed: () {
          _cont.login(context);
        },
        child: const Text('Ingresar'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.symmetric(vertical: 15.0)),
      ),
    );
  }

  Widget _rowDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('No tienes cuenta',
            style: TextStyle(color: MyColors.primaryColor)),
        const SizedBox(
          width: 7.0,
        ),
        GestureDetector(
          onTap: () {
            _cont.goToRegisterPage(context);
          },
          child: Text('Registrate',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyColors.primaryColor)),
        ),
      ],
    );
  }
}
