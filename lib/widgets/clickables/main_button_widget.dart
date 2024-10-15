import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key, required this.text,  this.textsize,  this.paddingbutten =const EdgeInsets.symmetric(vertical: 10.0),  required this.ontap});
  final String text;
  final double? textsize;
  final EdgeInsetsGeometry paddingbutten;
  final Function ontap;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: () {
        ontap();
      },
      style: ElevatedButton.styleFrom(
        padding: paddingbutten,
        backgroundColor: primaryColor, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: textsize, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
