import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:stadium/models/event_model.dart';
import 'package:stadium/pages/main/event_detail.dart';
import 'package:stadium/provider/staduim_provider.dart';

class NearbyEvent extends StatelessWidget {
  const NearbyEvent({super.key, required this.event});
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
            color: Colors.blue.shade600,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image with error handling
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  event.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade500,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.event,
                          size: 40,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade400,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
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
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              // Content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        event.name,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(IconlyBold.location,
                              color: Colors.blue[200], size: 12),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              stadium?.location ?? 'Location not available',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 11,
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
    });
  }
}
