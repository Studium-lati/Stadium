import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/main/see_all_event_page.dart';
import 'package:stadium/provider/event_provider.dart';
import 'package:stadium/provider/staduim_provider.dart';
import 'package:stadium/widgets/cards/nearby_event.dart';
import 'package:stadium/widgets/cards/treanding_event.dart';
import 'package:stadium/widgets/clickables/text_clickable.dart';
import 'package:stadium/widgets/inputs/search_text.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  TextEditingController searchController = TextEditingController();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Delay the API call to after the first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        Provider.of<EventProvider>(context, listen: false).getEvent();
        _isInitialized = true;
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<EventProvider, StaduimProvider>(
        builder: (context, eventConsumer, staduimConsumer, child) {
      return Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await eventConsumer.refreshEvents();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: SearchText(searchController: searchController),
                  ),
                  SizedBox(height: 22),
                  Text("Trending Events",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 20),
                  // Trending Events Section
                  _buildTrendingEvents(eventConsumer),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nearby Events",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: TextClickable(
                          text: "See All",
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeeAllEventPage()));
                          },
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Nearby Events Grid
                  _buildNearbyEvents(eventConsumer),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTrendingEvents(EventProvider eventConsumer) {
    if (!eventConsumer.isLoading && eventConsumer.events.isEmpty) {
      return Container(
        height: 253,
        child: Center(
          child: Text(
            'No events available',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    final itemCount = eventConsumer.isLoading
        ? 2
        : eventConsumer.events.length > 4
            ? 4
            : eventConsumer.events.length;

    if (itemCount == 0) {
      return Container(height: 253);
    }

    return SizedBox(
      height: 253,
      width: double.infinity,
      child: Swiper(
        autoplayDelay: 5000,
        autoplay: !eventConsumer.isLoading && eventConsumer.events.isNotEmpty,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: eventConsumer.isLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                  )
                : TreandingEvent(event: eventConsumer.events[index]),
          );
        },
        pagination: eventConsumer.events.isNotEmpty
            ? SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeSize: 10,
                  size: 8,
                  space: 5,
                  color: Colors.grey,
                  activeColor: Colors.white,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildNearbyEvents(EventProvider eventConsumer) {
    if (!eventConsumer.isLoading && eventConsumer.events.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Text(
            'No nearby events available',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    final itemCount = eventConsumer.isLoading ? 4 : eventConsumer.events.length;

    if (itemCount == 0) {
      return Container();
    }

    // Calculate grid height dynamically but with constraints
    final screenWidth = getScreenSize(context).width;
    final itemWidth = (screenWidth - 30) / 2; // 2 columns with spacing
    final itemHeight = itemWidth * 1.1; // Aspect ratio
    final rowCount = ((itemCount) / 2).ceil();
    final totalSpacing = (rowCount - 1) * 10; // 10 is mainAxisSpacing
    final gridHeight = (rowCount * itemHeight) + totalSpacing;

    return Container(
      height: gridHeight.clamp(200.0, 600.0), // Ensure valid bounds
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return eventConsumer.isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                )
              : NearbyEvent(event: eventConsumer.events[index]);
        },
      ),
    );
  }
}
