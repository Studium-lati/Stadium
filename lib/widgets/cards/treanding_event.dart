import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
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
        // Find matching stadium safely
        final matchingStadiums = staduimConsumer.stadiums
            .where((stadium) => stadium.id == event.stadiumId);
        final stadium =
            matchingStadiums.isNotEmpty ? matchingStadiums.first : null;

        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventDetailPage(
                          event: event,
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade700,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background image with proper error handling
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    event.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Try to load asset image if network fails
                      return Image.asset(
                        'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // If asset also fails, show placeholder
                          return Container(
                            color: Colors.blue.shade600,
                            child: Center(
                              child: Icon(
                                Icons.event,
                                size: 50,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                // Content overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          event.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              IconlyBold.location,
                              color: Colors.blue[200],
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                stadium?.location ?? 'Location not available',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
      },
    );
  }
}
