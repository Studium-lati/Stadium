import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
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
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg'),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Borussia Dortmund",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        CircleAvatar(
                                          maxRadius: 17,
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.bookmark,
                                              color: primaryColor,
                                              size: 17,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(IconlyBold.location,
                                            color: Colors.blue[800]),
                                        SizedBox(width: 10),
                                        Text("Benghazi",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
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
                      itemCount: 6,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.9),
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg'),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Borussia Dortmund",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        CircleAvatar(
                                          maxRadius: 12,
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.bookmark,
                                              color: primaryColor,
                                              size: 10,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(IconlyBold.location,
                                            color: Colors.blue[800]),
                                        SizedBox(width: 10),
                                        Text("Benghazi",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
