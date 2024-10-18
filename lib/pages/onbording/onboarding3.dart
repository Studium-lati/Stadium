import 'package:flutter/material.dart';
import 'package:stadium/pages/main/home_page.dart';
import 'package:stadium/widgets/cards/onbordings.dart';

class onboarding3 extends StatelessWidget {
  const onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Onbordings(
        tite: 'Explore events and  \nLeagues',
        descrpation:
            'Stay up to date on upcoming matches,\n tournaments, and league games',
        bouttentext: 'Get started',
        imgpath: 'assets/football-field.gif',
        value: 1,
        paddingbutten: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        ontap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TabsScreen()));
        });
  }
}
