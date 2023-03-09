import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/button_primary.dart';
import '../widgets/my_textfield.dart';
import '../widgets/text_primary.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    Navigator.pop(context);
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showErrorMessage('Password don\' match!');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorMessage('User not found');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Wrong Password');
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(message),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextPrimary(
              text: 'Create your account now',
            ),
            const SizedBox(height: 50),
            MyTextField(
              inputController: emailController,
              textHint: 'Email',
            ),
            const SizedBox(height: 20),
            MyTextField(
              inputController: passwordController,
              obsecure: true,
              textHint: 'Password',
            ),
            const SizedBox(height: 20),
            MyTextField(
              inputController: confirmPasswordController,
              obsecure: true,
              textHint: 'Confirm Password',
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonPrimary(
                  tap: () {
                    signIn();
                  },
                  text: 'Sign Up',
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text(
                'Sign In',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
