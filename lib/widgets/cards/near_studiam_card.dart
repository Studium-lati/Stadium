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
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
        child: Row(
          children: [
            // Fixed image container with explicit width
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: getScreenSize(context).width * 0.3,
                  height: getScreenSize(context).height * 0.15,
                  color: Colors.grey[200],
                  child: stadium.images.isNotEmpty
                      ? Image.network(
                          stadium.images.first.url,
                          width: getScreenSize(context).width * 0.3,
                          height: getScreenSize(context).height * 0.15,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                              width: getScreenSize(context).width * 0.3,
                              height: getScreenSize(context).height * 0.15,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/placeholder.png', // Provide a local placeholder
                          width: getScreenSize(context).width * 0.3,
                          height: getScreenSize(context).height * 0.15,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            SizedBox(width: 8),
            // Expanded column to take remaining space
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stadium.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Icon(IconlyLight.location,
                            color: Colors.grey, size: 16),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            stadium.location,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Rating section
                        Row(
                          children: [
                            Icon(IconlyBold.star,
                                color: Color(0xFFFFD233), size: 20),
                            SizedBox(width: 4),
                            Text(
                              stadium.rating.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Price section
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '\$${stadium.pricePerHour}/Hour',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
