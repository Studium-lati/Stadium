import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';


class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key, required this.text, 
   this.textsize,  this.paddingbutten =const EdgeInsets.symmetric(vertical: 10.0),  
   required this.ontap, 
    this.textcolor=Colors.white, 
    this.backgroundColor, });
  final String text;
  final double? textsize;
  final EdgeInsetsGeometry paddingbutten;
  final Function ontap;
  final Color textcolor;
  final Color? backgroundColor ;
  

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
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: grayColor,
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
