import 'package:flutter/material.dart';

import '../widgets/button_primary.dart';
import '../widgets/my_textfield.dart';
import '../widgets/text_primary.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextPrimary(
              text: 'Welcome Back !',
            ),
            const SizedBox(height: 50),
            const MyTextField(
              textHint: 'Email',
            ),
            const SizedBox(height: 20),
            const MyTextField(
              obsecure: true,
              textHint: 'Password',
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonPrimary(
                  text: 'Sign In',
                ),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 35,
              width: 180,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/google-logo.png'),
                  const Text(
                    'Sign In with Google',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
