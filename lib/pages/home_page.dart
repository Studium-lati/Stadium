import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/widgets/cards/StadiumCard%20_home.dart';
import 'package:stadium/widgets/cards/near_studiam_card.dart';
import 'package:stadium/widgets/clickables/app_bar_icon.dart';
import 'package:stadium/widgets/clickables/text_clickable.dart';
import 'package:stadium/widgets/inputs/search_text.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            AppBarIcons(function: () {}, icon: FontAwesomeIcons.bell),
            SizedBox(
              width: 20,
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Image.asset(
                "assets/Untitled-8[1].png",
                width: getScreenSize(context).width * 0.4,
                height: getScreenSize(context).height * 0.4,
              ),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                SearchText(searchController: searchController),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Filed',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextClickable(
                        text: "See All",
                        function: () {},
                        color: secondaryColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getScreenSize(context).height * 0.35,
                  width: getScreenSize(context).width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    padding: const EdgeInsets.all(8.0),
                    itemBuilder: (context, index) {
                      return CustomStadiumCard(
                        location: 'Hadayak, Benghazi',
                        rating: 4.4,
                        imageUrl:
                            'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                        stadiumName: 'tottenham stadium',
                        pricePerHour: 40,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Near You',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextClickable(
                        text: "See All",
                        function: () {},
                        color: secondaryColor,
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return NearStudiamCard(
                      location: 'Hadayak, Benghazi',
                      rating: 4.4,
                      imageUrl:
                          'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                      stadiumName: 'tottenham stadium',
                      pricePerHour: 40,
                    );
                  },
                ),
              ]),
            )));
  }
}
