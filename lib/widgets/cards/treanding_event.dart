import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/models/event_model.dart';
import 'package:stadium/pages/main/event_detail.dart';
import 'package:stadium/provider/staduim_provider.dart';

class TreandingEvent extends StatelessWidget {
  const TreandingEvent({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Consumer<StaduimProvider>(
      builder: (context, staduimConsumer, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EventDetailPage(event: event,)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
              image: DecorationImage(
                  image: Image.network(event.image,
                      errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                      fit: BoxFit.cover,
                    );
                  }).image,
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            event.name,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            maxRadius: 17,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                Icons.bookmark,
                                color: primaryColor,
                                size: 17,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(IconlyBold.location, color: Colors.blue[800]),
                          SizedBox(width: 10),
                          Text(
                              staduimConsumer.stadiums
                                  .where((stadium) =>
                                      stadium.id == event.stadiumId)
                                  .first
                                  .location,
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
