import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/models/event_model.dart';
import 'package:stadium/provider/staduim_provider.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});
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

      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event image with error handling
                    Container(
                      height: getScreenSize(context).height * 0.45,
                      width: double.infinity,
                      color: Colors.blue.shade100,
                      child: Image.network(
                        event.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.blue.shade200,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.event,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'No Image Available',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 70),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        event.description,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                    if (stadium != null) ...[
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Stadium Location',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                stadium.latitude is double
                                    ? stadium.latitude
                                    : double.tryParse(stadium.latitude.toString()) ?? 0.0,
                                stadium.longitude is double
                                    ? stadium.longitude
                                    : double.tryParse(stadium.longitude.toString()) ?? 0.0,
                              ),
                              zoom: 15,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId(stadium.id.toString()),
                                position: LatLng(
                                  stadium.latitude is double
                                      ? stadium.latitude
                                      : double.tryParse(stadium.latitude.toString()) ?? 0.0,
                                  stadium.longitude is double
                                      ? stadium.longitude
                                      : double.tryParse(stadium.longitude.toString()) ?? 0.0,
                                ),
                                infoWindow: InfoWindow(
                                  title: stadium.name,
                                  snippet: stadium.location,
                                ),
                              ),
                            },
                          ),
                        ),
                      ),
                    ],
                    SizedBox(height: 30),
                  ],
                ),
                // Event info card
                Positioned(
                  top: getScreenSize(context).height * 0.35,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          event.name,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (stadium != null) ...[
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.grey[600], size: 20),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  stadium.location,
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Colors.grey[600], size: 20),
                            SizedBox(width: 8),
                            Text(
                              event.date,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 14),
                            ),
                          ],
                        ),
                        if (stadium != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.stadium,
                                  color: Colors.grey[600], size: 20),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  stadium.name,
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                // Back button
                Positioned(
                  top: 40,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
