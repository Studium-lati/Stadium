import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';

class Onbording1 extends StatefulWidget {
  const Onbording1({super.key});

  @override
  State<Onbording1> createState() => _Onbording1State();
}

class _Onbording1State extends State<Onbording1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background for the entire screen
      backgroundColor: Colors.white,

      // Body of the screen
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Stadium Image (SVG or Asset)
              Image.asset(
                'assets/onbording/stadium.png', // Add your image to assets
                height: getScreenSize(context).height * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),

              // "Reserve pitch" Text
              Text(
                'Reserve pitch',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 30),

              // Subtitle Text
              Text(
                'Select from a variety of pitches\navailable in your area',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 80),

              // Progress bar or loading indicator
              SizedBox(
                width: getScreenSize(context).width * 0.2,
                child: LinearProgressIndicator(
                  value: 0.35, // You can adjust the value for progress
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        onPressed: () {
          // Define action here
        },
        backgroundColor: primaryColor, // Color of the button
        child: Text(
          'Next', // Text on the button
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
