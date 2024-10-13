import 'package:flutter/material.dart';
import 'package:stadium/pages/Onboarding%20_2_page.dart';
import 'package:stadium/pages/home_page.dart';
import 'package:stadium/pages/log_in_page.dart';
import 'package:stadium/pages/onboarding_3_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home_page(),
    );
  }
}
