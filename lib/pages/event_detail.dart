import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';


class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Image.asset(
                "assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg",
                  height: getScreenSize(context).height * 0.45,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 70,),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Integer id augue iaculis, iaculis orci ut, blandit quam. '
                'Mauris a nisi ut sapien blandit imperdiet Mont her Monther Monther Monther Monther'
               'jgbugu uugy hugyu hugugu  ugyugoygy . Read More..',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Column(
              children: [
                const Text(
                  'Venue & Location',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                         height: getScreenSize(context).height*0.15,
                         
                         width: double.infinity,
                      child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
             ),
             markers: {
              const Marker(
               markerId: MarkerId('stadium'),
                 position: LatLng(37.7749, -122.4194),
                ),
             },
                      ),
                        )
              ],
            ),
                
              ],
            ),
            Positioned(
                  top: getScreenSize(context).height * 0.35,
                  left:0 ,
                  right:0 ,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: getScreenSize(context).width*0.3,
                      decoration: BoxDecoration(
                                              color: Colors.white,
                    
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),

                         
                        ),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius:2 ,
                          offset: Offset(0, 1),
                        ),]
                      ),
                      padding: const EdgeInsets.all(26.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'League : Hamidha League',
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
                                'Gelora Bung Karno Stadium, Jakarta',
                                style: TextStyle(color:grayColor,fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                           Row(
                            children: [
                              Icon(Icons.calendar_today, color:grayColor),
                              SizedBox(width: 8),
                              Text(
                                'November 15, 2023',
                                style: TextStyle(color: grayColor,fontSize: 12)
                                ,
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                    ),
                  ),
                     
                ),
               
         
        
            
          ],
        ),
      ),
    );
  }
}
