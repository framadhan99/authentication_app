import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String textHint;
  final bool? obsecure;
  final inputController;

  const MyTextField({
    super.key,
    required this.textHint,
    this.obsecure,
    this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      obscureText: obsecure ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        hintText: textHint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
