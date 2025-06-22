import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/models/event_model.dart';
import 'package:stadium/pages/main/event_detail.dart';

class FavoriteEventCard extends StatelessWidget {
  const FavoriteEventCard({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(
              event: event,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xD3F8F9FA),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            // Image container with error handling
            Container(
              height: getScreenSize(context).height * 0.17,
              width: getScreenSize(context).width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[50],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  event.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.blue[100],
                      child: Center(
                        child: Icon(
                          Icons.event,
                          size: 40,
                          color: Colors.blue[300],
                        ),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.blue[50],
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue[300]!,
                          ),
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
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      event.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          IconlyBold.calendar,
                          color: Colors.blue[800],
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            event.date,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: event.status == 'active'
                            ? Colors.green[50]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        event.status.toUpperCase(),
                        style: TextStyle(
                          color: event.status == 'active'
                              ? Colors.green[700]
                              : Colors.grey[600],
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
