import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/cards/settings_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
     appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
                'Settings', 
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
               leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text("Account",style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),),
            ),
            SettingsCard(title:"Personal information" ,
             icontitle: Icon(Icons.person,color: primaryColor,) ,
             strokeColor: primaryColor,
           
             
             ),
            LinearProgressIndicator(
                  value: 1,
                  minHeight: 2,
                  borderRadius: BorderRadius.all(Radius.circular(10)), 
                  backgroundColor: Colors.grey.shade300,
                  color: grayColor,),

                  SizedBox(height: 30,),
                    Align(
              alignment: Alignment.topLeft,
              child: Text("Appearance",style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),),
                    ),
                      SettingsCard(title:"Night mode" ,
             icontitle: Icon(Icons.nightlight_round,color: Colors.white,) ,
             strokeColor: Colors.black,
             ContainerColor: Colors.black,

           
             
             ),
             SettingsCard(title:"Language" ,
             icontitle: Icon(Icons.language,color: grayColor,) ,
             strokeColor: grayColor,
             ),
              LinearProgressIndicator(
                  value: 1,
                  minHeight: 2,
                  borderRadius: BorderRadius.all(Radius.circular(10)), 
                  backgroundColor: Colors.grey.shade300,
                  color: grayColor,),         
                  SizedBox(height: 30,),
                    Align(
              alignment: Alignment.topLeft,
              child: Text("OTHER settings",style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),),
                    ),
             SettingsCard(title:"Feedback" ,
             icontitle: Icon(Icons.feedback,color: grayColor,) ,
             strokeColor: grayColor,
           
             
             ),
             SettingsCard(title:"Security" ,
             icontitle: Icon(Icons.security,color: grayColor,) ,
             strokeColor: grayColor,
           
             
             ),
            SettingsCard(title:"Help & Support" ,
             icontitle: Icon(Icons.help,color: grayColor,) ,
             strokeColor: grayColor,

           
             
             ),
            SettingsCard(title:"Privacy" ,
             icontitle: Icon(Icons.privacy_tip,
             color: grayColor,) ,
             strokeColor: grayColor,
             ),
              SettingsCard(title:"Logout" ,
              colortitle: Colors.red,
             icontitle: Icon(Icons.logout,color: Colors.red,) ,
             strokeColor: grayColor,
             ),




          ],
               
        ),
      )
      
    );
  }
}