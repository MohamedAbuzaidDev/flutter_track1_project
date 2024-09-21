import 'package:flutter/material.dart';

class BasketButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;
  const BasketButton({
    required this.onPressed,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize: const Size(150, 50),
      ),
      onPressed: onPressed,
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}