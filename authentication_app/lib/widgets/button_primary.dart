import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function()? tap;
  const ButtonPrimary({
    super.key,
    required this.text,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: 35,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.blueGrey[400],
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
