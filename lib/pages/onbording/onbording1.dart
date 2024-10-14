import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/onbording/onboarding%202.dart';
import 'package:stadium/widgets/onbordings.dart';

class Onbording1 extends StatefulWidget {
  const Onbording1({super.key});

  @override
  State<Onbording1> createState() => _Onbording1State();
}

class _Onbording1State extends State<Onbording1> {
  @override
  Widget build(BuildContext context) {
    return Onbordings(tite: 'Reserve  pitch',
     descrpation: 'Select from a variety of pitches \n  available in your area',
     bouttentext: 'Next', 
     imgpath: 'assets/stadium (1).gif', 
     value: 0.33,
            paddingbutten: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
        
            ontap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => onboarding2()));}
,

      
    );
  }
}
