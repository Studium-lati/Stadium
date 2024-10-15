import 'package:flutter/material.dart';
import 'package:stadium/widgets/cards/stduim_detalies.dart';

class StadiumDetails extends StatefulWidget {
  const StadiumDetails({super.key});

  @override
  State<StadiumDetails> createState() => _StadiumDetailsState();
}

class _StadiumDetailsState extends State<StadiumDetails> {
  @override
  Widget build(BuildContext context) {
    return StadiumDetailsCard (
        stadiumName: ' Borussia \nDortmund ', 
      imagePath: 'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg', 
      pricePerHour: 60, 
      rating: 4.4, 
      description: "This is a Libyan football stadium located in fawehat, a town 19 km east of Benghazi.  The stadium holds 10,550 people The pitch's dimensions are 105m x 68m.", 
    );
  }
}