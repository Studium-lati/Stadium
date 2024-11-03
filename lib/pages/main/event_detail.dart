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
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      event.image,
                      height: getScreenSize(context).height * 0.45,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 70,
                    ),
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
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Venue & Location',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: getScreenSize(context).height * 0.25,
                              width: getScreenSize(context).width * 8,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      staduimConsumer.stadiums
                                          .where((stadium) =>
                                              stadium.id == event.stadiumId)
                                          .first
                                          .latitude
                                          .toDouble(),
                                      staduimConsumer.stadiums
                                          .where((stadium) =>
                                              stadium.id == event.stadiumId)
                                          .first
                                          .longitude
                                          .toDouble()),
                                  zoom: 12,
                                ),
                                markers: {
                                  Marker(
                                    markerId: MarkerId('stadium'),
                                    position: LatLng(
                                        staduimConsumer.stadiums
                                            .where((stadium) =>
                                                stadium.id == event.stadiumId)
                                            .first
                                            .latitude
                                            .toDouble(),
                                        staduimConsumer.stadiums
                                            .where((stadium) =>
                                                stadium.id == event.stadiumId)
                                            .first
                                            .longitude
                                            .toDouble()),
                                    infoWindow:
                                        InfoWindow(title: 'tot   Stadium'),
                                  ),
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: getScreenSize(context).height * 0.35,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: getScreenSize(context).width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ]),
                      padding: const EdgeInsets.all(26.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'League : ${event.name}',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: grayColor),
                              SizedBox(width: 8),
                              Text(
                                staduimConsumer.stadiums
                                    .where((stadium) =>
                                        stadium.id == event.stadiumId)
                                    .first
                                    .location,
                                style:
                                    TextStyle(color: grayColor, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: grayColor),
                              SizedBox(width: 8),
                              Text(
                                event.date,
                                style:
                                    TextStyle(color: grayColor, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white54,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
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
