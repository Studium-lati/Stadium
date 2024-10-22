import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/auth/profile_page.dart';
import 'package:stadium/pages/main/event_page.dart';
import 'package:stadium/pages/main/favourite.dart';
import 'package:stadium/pages/main/match_page.dart';
import 'package:stadium/pages/main/notification_page.dart';
import 'package:stadium/pages/main/stduim_detalies.dart';
import 'package:stadium/provider/staduim_provider.dart';
import 'package:stadium/widgets/cards/StadiumCard%20_home.dart';
import 'package:stadium/widgets/cards/near_studiam_card.dart';
import 'package:stadium/widgets/clickables/app_bar_icon.dart';
import 'package:stadium/widgets/clickables/text_clickable.dart';
import 'package:stadium/widgets/inputs/search_text.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _selectedIndex == 0
                ? HomePage()
                : _selectedIndex == 1
                    ? EventPage()
                    : _selectedIndex == 2
                        ? MatchPage()
                        : _selectedIndex == 3
                            ? Favourite()
                            : ProfilePage()),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.trophy),
              label: 'Cup',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flash_on),
              label: 'Match',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.heart),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.profile),
              label: 'Profile',
            ),
          ],
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<StaduimProvider>(
        builder: (context, staduimConsumer, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            AppBarIcons(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()));
                },
                icon: FontAwesomeIcons.bell),
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
                    itemCount: staduimConsumer.isLoading
                        ? 2 // to show shimmer
                        : staduimConsumer.stadiums.length,
                    padding: const EdgeInsets.all(8.0),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StadiumDetailsCard(
                                      stadium:
                                          staduimConsumer.stadiums[index])));
                        },
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: staduimConsumer.isLoading
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.black12,
                                        highlightColor: Colors.white38,
                                        child: Container(
                                          color: Colors.white,
                                          width: getScreenSize(context).width *
                                              0.6,
                                          height:
                                              getScreenSize(context).height *
                                                  0.7,
                                        )),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CustomStadiumCard(
                                    stadium: staduimConsumer.stadiums[index],
                                  ),
                                ),
                        ),
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
                  itemCount: staduimConsumer.isLoading
                      ? 4 // to show shimmer

                      : staduimConsumer.stadiums.length,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: staduimConsumer.isLoading
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white38,
                                  child: Container(
                                    color: Colors.white,
                                    height:
                                        getScreenSize(context).height * 0.17,
                                    width: getScreenSize(context).width,
                                  )),
                            )
                          : NearStudiamCard(
                              stadium: staduimConsumer.stadiums[index],
                            ),
                    );
                  },
                ),
              ]),
            )),
      );
    });
  }
}
