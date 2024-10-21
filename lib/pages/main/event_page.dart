import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/provider/event_provider.dart';
import 'package:stadium/provider/staduim_provider.dart';
import 'package:stadium/widgets/cards/nearby_event.dart';
import 'package:stadium/widgets/cards/treanding_event.dart';
import 'package:stadium/widgets/inputs/search_text.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer2<EventProvider, StaduimProvider>(
        builder: (context, eventConsumer, staduimConsumer, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: SearchText(searchController: searchController),
                  ),
                  SizedBox(height: 22),
                  Text("Treanding Events",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 253,
                    width: double.infinity,
                    child: Swiper(
                      autoplayDelay: 5000,
                      autoplay: true,
                      itemCount: eventConsumer.isLoading
                          ? 2
                          : eventConsumer.events.length,
                      itemBuilder: (context, index) {
                        return AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: eventConsumer.isLoading
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  : TreandingEvent(
                                      event: eventConsumer.events[index]),
                            ));
                      },
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeSize: 10,
                              size: 8,
                              space: 5,
                              color: Colors.grey,
                              activeColor: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nearby Event",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text("View All",
                            style: TextStyle(
                              fontSize: 14,
                              color: primaryColor,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: getScreenSize(context).width,
                    child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: eventConsumer.isLoading
                            ? 2
                            : eventConsumer.events.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.9),
                        itemBuilder: (context, index) {
                          return AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: eventConsumer.isLoading
                                    ? Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    : NearbyEvent(
                                        event: eventConsumer.events[index])),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
