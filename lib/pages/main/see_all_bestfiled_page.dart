import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/provider/staduim_provider.dart';
import 'package:stadium/widgets/cards/favorite_card.dart';

class SeeAllBest extends StatelessWidget {
  const SeeAllBest({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StaduimProvider>(
        builder: (context, staduimConsumer, child) {
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
                    const SizedBox(height: 20),
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: staduimConsumer.isLoading
                            ? 4
                            : staduimConsumer.beststadiums.length,
                        itemBuilder: (context, index) {
                          return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: staduimConsumer.isLoading
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
                                      child: FavoriteCard(
                                        stadium:
                                            staduimConsumer.beststadiums[index],
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
