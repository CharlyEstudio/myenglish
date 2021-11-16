import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myenglish/controllers/sesions.controller.dart';
import 'package:myenglish/utils/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('Home Page'),
            _buttonSignOut(),
          ],
        ),
      ),
    );
  }

  Widget _buttonSignOut() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
      child: ElevatedButton(
        onPressed: () {
          _cont.signOut(context);
        },
        child: const Text('Cerrar Sesión'),
        style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.symmetric(vertical: 15.0)),
      ),
    );
  }
}
