import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String time;
  final String description;
  final String? buttonText;

  const NotificationCard({
    super.key,
    required this.title,
    required this.time,
    required this.description,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenSize(context).height * 0.23,
      width: getScreenSize(context).width,
     decoration: BoxDecoration(  border: Border.all(
                color: grayColor, 
                width: 1.0,  
                   
              ),
              borderRadius: BorderRadius.circular(10),
     ),
      
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(

              title,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              time,
              style: TextStyle(
                fontSize: 12.0,
                color: grayColor,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            
              SizedBox(height: getScreenSize(context).height*0.04, 
),
              Mainbutton(
                paddingbutten: EdgeInsets.only(bottom:12 ,left: 10,right:10 ,top:12 ),
                text: buttonText!,
                textsize: 12.0,
                ontap: () {
              
                },
                

                textcolor:primaryColor,
                backgroundColor: Colors.white,
              ),

            ],

          
        ),
      ),
    );
  }
}