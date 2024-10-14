import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/pages/onbording/onboarding3.dart';
import 'package:stadium/widgets/main_button_widget.dart';
import 'package:stadium/widgets/onbordings.dart';

class onboarding2 extends StatelessWidget {
  const onboarding2({super.key});

  @override
  Widget build(BuildContext context) {

    return  Onbordings(tite: 'Challenge against \nothers',
     descrpation: 'Challenge local teams to matches at premium stadiums.',
      bouttentext: 'Next',
       imgpath: 'assets/football-player (1).gif',
        value: 0.66,
       paddingbutten: EdgeInsets.symmetric(vertical: 10,horizontal: 25),   
       ontap:(){
         Navigator.push(context, MaterialPageRoute(builder: (context) => onboarding3()));
       }
    );
  }
}