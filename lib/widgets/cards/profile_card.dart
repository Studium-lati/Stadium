import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';

class StadiumCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;

  const StadiumCard({
    Key? key,
    required this.title,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:5 ,left: 15,right:15 ,top:5 ),
      child: Container(
       
          decoration: BoxDecoration(  border: Border.all(
                color: grayColor, 
                width: 0.5,  
                   

              ),
              borderRadius: BorderRadius.circular(10),
          
         
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                   "Stadium:"+ title,
                      style: TextStyle(
                        fontSize: 14,
                        color: grayColor
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                     "Date:"+ date,
                      style: TextStyle(
                        fontSize: 14,
                        color: grayColor
                      ),
                    ),
                    SizedBox(height: 10),
                   
                      Mainbutton(text: "view" ,ontap: (){},backgroundColor: Colors.white,
                      textcolor: primaryColor,
                      textsize: 14,
                      strokeColor: primaryColor,
          
                      ),
          
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Image.asset(
                 imagePath,
           
                  fit: BoxFit.cover,
                  height: getScreenSize(context).height * 0.18,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
