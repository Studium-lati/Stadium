import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/main.dart';
import 'package:stadium/provider/auth_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ScreenRouter()));
    });
    Provider.of<AuthenProvider>(context, listen: false).isFirstTimee();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo_remove.png',
          height: getScreenSize(context).height * 0.5,
          width: getScreenSize(context).width * 0.5,
        ),
      ),
    );
  }
}
