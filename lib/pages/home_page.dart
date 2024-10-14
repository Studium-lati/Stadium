import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/widgets/StadiumCard%20_home.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
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
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications),)
          ]
        ),
        
      
      ),
         body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView(
            children: [
              Padding(
                        padding: const EdgeInsets.only(top: 30,left: 6,right: 80,bottom:30 ),
          
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Filed',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
             
                SizedBox(
                  height: getScreenSize(context).height*0.3,
                  width: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: CustomStadiumCard(
                            
                                              
                            location: 'Hadayak, Benghazi',
                             rating: 4.4,
                                             
                            imageUrl:'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg', stadiumName: 'tottenham stadium',
                             pricePerHour: 40,
                            
                          
                          ),
                        ),
                      );
                    },
                  ),
                ),
              
            ]
          ),
        )
        
         )
     
    );
  }
}

