import 'package:flutter/material.dart';
class BasketText extends StatelessWidget {
  final String data;
  final double fontSize; 
  const BasketText({super.key, required this.data, this.fontSize = 42});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
