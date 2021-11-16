import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionController {
  FirebaseAuth auth = FirebaseAuth.instance;

  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage(BuildContext context) {
    Navigator.pushNamed(context, 'register');
  }

  void goToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }

  void login(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      var signIn =
          auth.signInWithEmailAndPassword(email: email, password: password);

      if (signIn != null) {
        goToHomePage(context);
      }
    } catch (e) {
      print(e);
    }
  }

  void goToHomePage(BuildContext context) {
    Navigator.pushNamed(context, 'home');
  }

  void register(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      var newUser =
          auth.createUserWithEmailAndPassword(email: email, password: password);

      if (newUser != null) {
        goToHomePage(context);
      }
    } catch (e) {
      print(e);
    }
  }

  void signOut(BuildContext context) {
    auth.signOut();
    goToLoginPage(context);
  }
}
