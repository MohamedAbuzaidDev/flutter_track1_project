import 'package:flutter/material.dart';
import 'package:track1_project/core/constants/colors.dart';
import 'package:track1_project/core/routes/routes_name.dart';
import 'package:track1_project/widgets/starter_app_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: AppColor.bg,
      body: _body(),
    );
  }

  SafeArea _body() {
    return const SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StarterAppItem(
          imagePath: 'lamp',
          title: 'Lighter App',
          routesName: RoutesName.lighterApp,
        ),
        StarterAppItem(
          imagePath: 'basket',
          title: 'BasketBall App',
          routesName: RoutesName.basketApp,
        ),
        StarterAppItem(
          imagePath: 'calc',
          title: 'Calculator App',
          routesName: RoutesName.calculatorApp,
        ),
        StarterAppItem(
          imagePath: 'xo',
          title: 'Tic Tac App',
          routesName: RoutesName.xoApp,
        ),
      ],
    ),
    ));
  }

  AppBar _appBar() {
    return AppBar(title: Text('Home Page',
    style: TextStyle(
      color: AppColor.white
    ),
    ),
    backgroundColor: AppColor.black,
    );
  }
}