import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key, required this.text,  this.textsize, this.paddingbutten});
  final String text;
  final double? textsize;
  final int? paddingbutten;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: paddingbutten!.toDouble()),
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
