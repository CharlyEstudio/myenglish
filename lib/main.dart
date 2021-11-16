import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myenglish/pages/home/home.page.dart';
import 'package:myenglish/pages/login/login.page.dart';
import 'package:myenglish/pages/register/register.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage(),
        'home': (BuildContext context) => const HomePage(),
      },
    );
  }
}
