
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/models/staduim_model.dart';

class CustomStadiumCard extends StatelessWidget {
  final StadiumsModel stadium;

  CustomStadiumCard({super.key, required this.stadium});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenSize(context).width * 0.6,
      height: getScreenSize(context).height * 0.7,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  stadium.image!,
                  height: getScreenSize(context).height * 0.2,
                  width: getScreenSize(context).width * 0.7,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                      height: getScreenSize(context).height * 0.17,
                      width: getScreenSize(context).width * 0.35,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stadium.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(IconlyLight.location, color: Colors.grey, size: 16),
                    SizedBox(width: 8),
                    Text(
                      stadium.location,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(IconlyBold.star,
                            color: Color(0xFFFFD233), size: 22),
                        SizedBox(width: 6),
                        Text(
                          stadium.rating.toString().substring(0, 3),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: getScreenSize(context).width * 0.23,
                        ),
                        Text(
                          '\$${stadium.pricePerHour}/Hour',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }