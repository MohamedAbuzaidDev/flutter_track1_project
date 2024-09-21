import 'package:basket_app/widgets/btn.dart';
import 'package:basket_app/widgets/text.dart';
import 'package:flutter/material.dart';

class BasketAppScreen extends StatefulWidget {
  const BasketAppScreen({super.key});

  @override
  State<BasketAppScreen> createState() => _BasketAppScreenState();
}

class _BasketAppScreenState extends State<BasketAppScreen> {
  int pointA = 0;
  int pointB = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
      foregroundColor: Colors.white,
      title: const Text(
        'Basket App',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.orange[700],
    );
  }

  SafeArea _body() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          _teams(),
          const Spacer(),
          BasketButton(onPressed: () => setState(() {
                      pointA = 0;
                      pointB = 0;
                    }), data: 'Reset'),
          const Spacer(),
        ],
      ),
    );
  }

  Row _teams() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //! Team A
        Column(
          children: [
            const BasketText(data: 'Team A'),
            BasketText(
              data: '$pointA',
              fontSize: 200,
            ),
            BasketButton(
                onPressed: () => setState(() {
                      pointA += 1;
                    }),
                data: 'Add 1 Point'),
            btnSpacer(),
            BasketButton(onPressed: () => setState(() {
                      pointA += 2;
                    }), data: 'Add 2 Point'),
            btnSpacer(),
            BasketButton(onPressed: () => setState(() {
                      pointA += 3;
                    }), data: 'Add 3 Point'),
          ],
        ),
        _verticalLine(),
        //! Team B
        Column(
          children: [
            const BasketText(data: 'Team B'),
            BasketText(
              data: '$pointB',
              fontSize: 200,
            ),
            BasketButton(onPressed: () => setState(() {
                      pointB += 1;
                    }), data: 'Add 1 Point'),
            btnSpacer(),
            BasketButton(onPressed: () => setState(() {
                      pointB += 2;
                    }), data: 'Add 2 Point'),
            btnSpacer(),
            BasketButton(onPressed: () => setState(() {
                      pointB += 3;
                    }), data: 'Add 3 Point'),
          ],
        ),
      ],
    );
  }

  SizedBox btnSpacer() {
    return const SizedBox(
      height: 16,
    );
  }

  SizedBox _verticalLine() {
    return const SizedBox(
      height: 500,
      child: VerticalDivider(
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }
}
