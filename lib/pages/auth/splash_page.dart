import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/auth/log_in_page.dart';
import 'package:stadium/pages/onbording/onbording1.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onbording1()));
    });
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
