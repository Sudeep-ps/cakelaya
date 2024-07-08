import 'package:flutter/material.dart';

class CustomTextbutton extends StatelessWidget {
  final String text;
  final double radius;
  final VoidCallback onPressed;

  const CustomTextbutton(
      {super.key,
      required this.text,
      required this.radius,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromRGBO(255, 22, 22, 1),
      height: 40,
      minWidth: MediaQuery.sizeOf(context).width,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      onPressed: onPressed,
      textColor: Colors.white,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
