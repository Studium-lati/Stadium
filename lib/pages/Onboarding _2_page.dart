import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/main_button_widget.dart';

class onboarding2 extends StatelessWidget {
  const onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Skip",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor),),
          )
         
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/football-player.png",width: size.width*0.44,
            height: size.height*0.45,
            
            ),
            SizedBox(height: 33,),
            Text("Challenge against others",style: TextStyle(fontSize: 24,color:primaryColor,fontWeight: FontWeight.bold ),
            
            ),
              SizedBox(height: 33,),
              Center(child: Text("Challenge local teams to matches \n           at premium stadiums.",style: TextStyle(fontSize: 18,))),
              SizedBox(height: 42,),
              Container(
                width: 105,
                height: 43,
                child: Mainbutton(text: 'Next',textsize: 14,paddingbutten: 6,)),
                              SizedBox(height: 43,),

Image.asset("assets/Group 385.png",width: size.width*0.2,
           )


          ],

        )
      )

    );
  }
}