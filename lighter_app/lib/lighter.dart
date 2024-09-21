import 'package:flutter/material.dart';

class LighterScreen extends StatefulWidget {
  const LighterScreen({super.key});

  @override
  State<LighterScreen> createState() => _LighterScreenState();
}

class _LighterScreenState extends State<LighterScreen> {
  bool switcher = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _body());
  }

  SafeArea _body() {
    return SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lightbulb,
                size: 100,
                color: switcher ? Colors.orange : Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    switcher = !switcher;
                  });
                },
                color: switcher ? Colors.red : Colors.green,
                child: Text(
                  switcher ? 'Off' : 'On',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
  }

  AppBar _appBar() {
    return AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Lighter App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange[700],
      );
  }
}
