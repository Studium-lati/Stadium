import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: 
         
        

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/Untitled-8[1].png",width: size.width*0.4,height: size.height*0.3,),
          ),
       //   IconButton(onPressed: (){}, icon: Icons.notifications)
          ]
        )
        
        
    
      ),
      
     
    );
  }
}
