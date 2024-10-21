import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/models/staduim_model.dart';
import 'package:stadium/pages/main/stduim_detalies.dart';

class NearStudiamCard extends StatelessWidget {
  const NearStudiamCard({
    super.key,
    required this.stadium,
  });
  final StadiumsModel stadium;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StadiumDetailsCard(
              stadium: stadium,
            ),
          ),
        );
      },
      child: Container(
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
                child: stadium.image != null
                    ? Image.network(
                        stadium.image!,
                        height: getScreenSize(context).height * 0.17,
                        width: getScreenSize(context).width * 0.35,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                            height: getScreenSize(context).height * 0.17,
                            width: getScreenSize(context).width * 0.35,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
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
                  stadium.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Row(
                  children: [
                    Icon(IconlyLight.location, color: Colors.grey, size: 16),
                    SizedBox(width: 10),
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
                Row(
                  children: [
                    Icon(IconlyBold.star, color: Color(0xFFFFD233), size: 22),
                    SizedBox(width: 4),
                    Text(
                      stadium.rating.toString().substring(0, 3),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: getScreenSize(context).width * 0.15,
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
            )
          ],
        ),
      ),
    );
  }
}
