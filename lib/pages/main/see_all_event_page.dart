import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/provider/event_provider.dart';
import 'package:stadium/widgets/cards/favorite_event_card.dart';

class SeeAllEventPage extends StatelessWidget {
  const SeeAllEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, eventConsumer, child) {
      return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: eventConsumer.isLoading
                            ? 4
                            : eventConsumer.events.length,
                        itemBuilder: (context, index) {
                          return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: eventConsumer.isLoading
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, bottom: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.black12,
                                            highlightColor: Colors.white38,
                                            child: Container(
                                              color: Colors.white,
                                              width:
                                                  getScreenSize(context).width *
                                                      0.9,
                                              height: getScreenSize(context)
                                                      .height *
                                                  0.17,
                                            )),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: FavoriteEventCard(
                                        event: eventConsumer.events[index],
                                      ),
                                    ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
