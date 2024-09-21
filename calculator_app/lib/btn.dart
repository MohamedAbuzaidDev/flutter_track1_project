import 'package:flutter/material.dart';

enum CalcButtonType {num, helper, equal, operation}

class CalcButton extends StatelessWidget {
  final CalcButtonType type;
  final String txt;
  final VoidCallback onPressed;
  const CalcButton({
    required this.onPressed,
    required this.type,
    required this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: setBtn());
  }

  Widget setBtn() {
    Color? containerColor;
    switch(type) {
      case CalcButtonType.equal:
        containerColor = Colors.orange;
      case CalcButtonType.helper:
        containerColor = Colors.blueAccent[100];
      case CalcButtonType.operation:
        containerColor = Colors.blue;
      case CalcButtonType.num:
        containerColor = Colors.white;
    }
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        color: containerColor,
        height: double.infinity,
        child: Text(txt, style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: (type == CalcButtonType.equal) || (type == CalcButtonType.operation) ? Colors.white : Colors.black
        ),),
      ),
    );
  }
}