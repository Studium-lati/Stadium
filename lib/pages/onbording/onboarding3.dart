import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/pages/home_page.dart';
import 'package:stadium/widgets/main_button_widget.dart';
import 'package:stadium/widgets/onbordings.dart';

class onboarding3 extends StatelessWidget {
  const onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Onbordings(tite: 'Explore events and  \nLeagues',
     descrpation: 'Stay up to date on upcoming matches,\n tournaments, and league games', 
     bouttentext: 'Get started',
      imgpath: 'assets/football-field.gif',
       value: 1,
       paddingbutten: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        ontap: (){
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_page()));
        }      

    );
  }
}