import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: primaryColor, // Green color for the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
