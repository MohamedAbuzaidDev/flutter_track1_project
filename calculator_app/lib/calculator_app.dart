import 'package:calculator_app/btn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String equation = '';
  String result = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      foregroundColor: Colors.white,
      title: const Text(
        'Calculator App',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _resultBox(),
        ),
        Expanded(
          flex: 2,
          child: buttonsBox(),
        ),
      ],
    );
  }

  Container _resultBox() {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      color: Colors.grey[700],
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            equation,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            result,
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Column buttonsBox() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              CalcButton(
                type: CalcButtonType.helper, 
                txt: 'C',
                onPressed: () => setState(() {
                  equation = '';
                  result = '0';
                }),
                ),
              CalcButton(
                type: CalcButtonType.helper, 
                txt: "+/-",
                onPressed: () {},),
              CalcButton(
                type: CalcButtonType.helper, 
                txt: "%",
                onPressed: () {},
                ),
              CalcButton(
                type: CalcButtonType.helper, 
                txt: 'DEL',
                onPressed: () => setState(() {
                  equation = equation.substring(0, equation.length - 1);
                }),
                ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              CalcButton(
                type: CalcButtonType.num, 
                txt: '7',
                onPressed: () => setState(() => equation = '${equation}7'),
              ),
              CalcButton(
                type: CalcButtonType.num, 
                txt: "8",
                onPressed: () => setState(() => equation = '${equation}8'),),
              CalcButton(
                type: CalcButtonType.num, 
                txt: "9",
                onPressed: () => setState(() => equation = '${equation}9'),),
              CalcButton(
                type: CalcButtonType.operation, 
                txt: '/',
                onPressed: () => setState(() => equation = '$equation/'),),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              CalcButton(
                type: CalcButtonType.num, 
                txt: '4',
                onPressed: () => setState(() => equation = '${equation}4'),),
              CalcButton(
                type: CalcButtonType.num, 
                txt: "5",
                onPressed: () => setState(() => equation = '${equation}5'),),
              CalcButton(
                type: CalcButtonType.num, 
                txt: "6",
                onPressed: () => setState(() => equation = '${equation}6'),),
              CalcButton(
                type: CalcButtonType.operation, 
                txt: '*',
                onPressed: () => setState(() => equation = '$equation*'),),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              CalcButton(
                type: CalcButtonType.num, 
                txt: '1',
                onPressed: () => setState(() => equation = '${equation}1'),),
              CalcButton(
                type: CalcButtonType.num, 
                txt: "2",
                onPressed: () => setState(() => equation = '${equation}2'),),
              CalcButton(
                type: CalcButtonType.num, 
                txt: "3",
                onPressed: () => setState(() => equation = '${equation}3'),),
              CalcButton(
                type: CalcButtonType.operation, 
                txt: '-',
                onPressed: () => setState(() => equation = '$equation-'),),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              CalcButton(
                type: CalcButtonType.num, 
                txt: '0',
                onPressed: () => setState(() => equation = '${equation}0'),),
              CalcButton(
                type: CalcButtonType.num, 
                txt: ".",
                onPressed: () => setState(() => equation = '$equation.'),),
              CalcButton(
                type: CalcButtonType.equal, 
                txt: "=",
                onPressed: () => setState(() {
                  Parser p = Parser();
                  Expression exp = p.parse(equation);
                  ContextModel cm = ContextModel();
                  double eval = exp.evaluate(EvaluationType.REAL, cm);
                  result = eval.toString();
                }),),
              CalcButton(
                type: CalcButtonType.operation, 
                txt: '+',
                onPressed: () => setState(() => equation = '$equation+'),),
            ],
          ),
        ),
      ],
    );
  }
}
