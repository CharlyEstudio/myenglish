import 'package:flutter/material.dart';

class SessionController {
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

    print('EMAIL: $email');
    print('PASSWORD: $password');

    goToHomePage(context);
  }

  void goToHomePage(BuildContext context) {
    Navigator.pushNamed(context, 'home');
  }

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String telephone = telephoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('EMAIL: $email');
    print('NAME: $name');
    print('LAST NAME: $lastName');
    print('TELEPHONE: $telephone');
    print('PASSWORD: $password');
    print('CONFIRM PASSWORD: $confirmPassword');
  }
}
