import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/provider/favorite_provider.dart';
import 'package:stadium/widgets/cards/favorite_card.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/search_text.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavoriteProvider>(context, listen: false).getStaduim();
  }

  String selectedButton = "All";

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenProvider, FavoriteProvider>(
        builder: (context, authConsumer, favoriteConsumer, child) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Column(
              children: [
                SearchText(searchController: searchController),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: getScreenSize(context).width * 0.29,
                      child: Mainbutton(
                        text: "All",
                        ontap: () {
                          setState(() {
                            selectedButton = "All";
                          });
                        },
                        backgroundColor: selectedButton == "All"
                            ? primaryColor
                            : Colors.white,
                        textcolor: selectedButton == "All"
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: getScreenSize(context).width * 0.29,
                      child: Mainbutton(
                        text: "Event",
                        ontap: () {
                          setState(() {
                            selectedButton = "Event";
                          });
                        },
                        backgroundColor: selectedButton == "Event"
                            ? primaryColor
                            : Colors.white,
                        textcolor: selectedButton == "Event"
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: getScreenSize(context).width * 0.29,
                      child: Mainbutton(
                        text: "Stadium",
                        ontap: () {
                          setState(() {
                            selectedButton = "Stadium";
                          });
                        },
                        backgroundColor: selectedButton == "Stadium"
                            ? primaryColor
                            : Colors.white,
                        textcolor: selectedButton == "Stadium"
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: favoriteConsumer.isLoading
                        ? 4
                        : favoriteConsumer.staduimModel.length,
                    itemBuilder: (context, index) {
                      return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: favoriteConsumer.isLoading
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
                                          width: getScreenSize(context).width *
                                              0.9,
                                          height:
                                              getScreenSize(context).height *
                                                  0.17,
                                        )),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: FavoriteCard(
                                    stadium:
                                        favoriteConsumer.staduimModel[index],
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
