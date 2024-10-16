import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/widgets/cards/notifications_card.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
  
          body: Padding(

            padding: const EdgeInsets.only(left:8 ,right:8 ,top: 40,bottom: 15),
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              
                    
                    children: [
                      
                      Container(
                              
                  width:       getScreenSize(context).width * 0.28,
                  height:       getScreenSize(context).height * 0.05,
                        child: Mainbutton(text: 'All', ontap: (){},
                        textsize: 14,          
                              paddingbutten:EdgeInsets.only( ) ,
                                        ),
                      ),
                  
                      Container(
                         width:       getScreenSize(context).width * 0.28,
                  height:       getScreenSize(context).height * 0.05,
                        child: Mainbutton(text: 'Bookings', 
                        ontap: (){},
                        textsize: 14,
                        textcolor: grayColor,
                        backgroundColor: Colors.white,
                        
                        
                        ),
                      ),
                      Container(
                         width:       getScreenSize(context).width * 0.28,
                  height:       getScreenSize(context).height * 0.05,
                        child: Mainbutton(text: 'Match Requests', 
                        ontap: (){},
                        textsize: 12,
                        textcolor: grayColor,
                        backgroundColor: Colors.white,
                                        
                        ),
                      ),
                              
                    ],
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 15,
                      padding: const EdgeInsets.all(8.0),
                      itemBuilder: (context, index) {
                        return  NotificationCard(
                      title: 'Booking Confirmed',
                      time: '10:45 AM',
                      description: 'Your booking at Greenfield Stadium is confirmed.',
                      buttonText: 'View Booking',
                    );
                      }
                  )
                ],
              ),
            ),
            
          ),

          
    );
  }
}