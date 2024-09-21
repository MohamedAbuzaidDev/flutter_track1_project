import 'package:flutter/material.dart';
import 'package:track1_project/core/constants/colors.dart';
import 'package:track1_project/core/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(RoutesName.home);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
          child: Center(
        child: Text(
          'AIO App',
          style: TextStyle(
              fontSize: 60,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'SUSE'),
        ),
      )),
    );
  }
}
