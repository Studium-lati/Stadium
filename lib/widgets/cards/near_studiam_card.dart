import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:stadium/helper/function_helper.dart';

class NearStudiamCard extends StatelessWidget {
  const NearStudiamCard(
      {super.key,
      required this.imageUrl,
      required this.stadiumName,
      required this.location,
      required this.rating,
      required this.pricePerHour});
  final String imageUrl;
  final String stadiumName;
  final String location;
  final double rating;
  final double pricePerHour;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenSize(context).height * 0.17,
      width: getScreenSize(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ]),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: getScreenSize(context).height * 0.17,
                width: getScreenSize(context).width * 0.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stadiumName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Row(
                children: [
                  Icon(IconlyLight.location, color: Colors.grey, size: 16),
                  SizedBox(width: 10),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(IconlyBold.star, color: Color(0xFFFFD233), size: 22),
                  SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: getScreenSize(context).width * 0.17,
                  ),
                  Text(
                    '\$${pricePerHour}/Hour',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
