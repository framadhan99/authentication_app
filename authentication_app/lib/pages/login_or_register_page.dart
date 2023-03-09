import 'package:authentication_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'register_page.dart';

class LoginOrRegPage extends StatefulWidget {
  const LoginOrRegPage({super.key});

  @override
  State<LoginOrRegPage> createState() => _LoginOrRegPageState();
}

class _LoginOrRegPageState extends State<LoginOrRegPage> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: tooglePages,
      );
    } else {
      return RegisterPage();
    }
  }
}
