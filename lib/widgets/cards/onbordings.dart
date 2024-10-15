import 'package:flutter/material.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';

class Onbordings extends StatelessWidget {
  const Onbordings(
      {super.key,
      required this.tite,
      required this.descrpation,
      required this.bouttentext,
      this.paddingbutten = const EdgeInsets.symmetric(vertical: 10.0),
      required this.imgpath,
      required this.value,
      required this.ontap});
  final String tite;
  final String descrpation;
  final String bouttentext;
  final String imgpath; //imge path
  final double value; //value of LinearProgressIndicator
  final EdgeInsetsGeometry paddingbutten;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                imgpath,
                height: getScreenSize(context).height * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),

              Text(
                textAlign: TextAlign.center,
                tite,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 30),

              // Subtitle Text
              Text(
                descrpation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 42),
              Flexible(
                  child: Container(
                      child: Mainbutton(
                text: bouttentext,
                paddingbutten: paddingbutten,
                ontap: () {
                  ontap();
                },
              ))),

              SizedBox(height: 42),

              // Progress bar or loading indicator
              SizedBox(
                width: getScreenSize(context).width * 0.2,
                child: LinearProgressIndicator(
                  value: value, // You can adjust the value for progress
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
