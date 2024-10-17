import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';


class Mainbutton extends StatelessWidget {
  Mainbutton({super.key,
   required this.text, 
   this.textsize, 
   this.paddingbutten = const EdgeInsets.symmetric(vertical: 10.0),  
   required this.ontap, 
    this.textcolor = Colors.white, 
    this.backgroundColor,
     BorderRadius? borderbutton, 
     this.strokeColor = Colors.grey}) 
     : borderbutton = borderbutton ?? BorderRadius.circular(8.0);

  final String text;
  final double? textsize;
  final EdgeInsetsGeometry paddingbutten;
  final Function ontap;
  final Color textcolor;
  final Color? backgroundColor ;
  final BorderRadius?borderbutton;
  final Color strokeColor ;

  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     
      onPressed: () {
        ontap();
      },
      style: ElevatedButton.styleFrom(
        padding: paddingbutten,
        backgroundColor: backgroundColor??primaryColor, 
        shape: RoundedRectangleBorder(
          borderRadius: borderbutton as BorderRadiusGeometry,
          side: BorderSide(
            color:strokeColor ,
            width: 1
          )
        ),
        
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: textsize, color:textcolor, fontWeight: FontWeight.bold),

      ),
      
   
    );
  }
}
