import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/main.dart';
import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/search_text.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context, authConsumer, child) {
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
                          Provider.of<AuthenProvider>(context, listen: false)
                              .logout()
                              .then((onValue) {
                            if (onValue) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScreenRouter()));
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: getScreenSize(context).width * 0.29,
                      child: Mainbutton(
                        text: "Event",
                        ontap: () {},
                        backgroundColor: Colors.white,
                        textcolor: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: getScreenSize(context).width * 0.29,
                      child: Mainbutton(
                          text: "Stadium",
                          ontap: () {},
                          backgroundColor: Colors.white,
                          textcolor: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xD3F8F9FA),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: getScreenSize(context).height * 0.17,
                              width: getScreenSize(context).width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Arsenal stadium",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      IconlyBold.location,
                                      color: Colors.blue[800],
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Haware, Benghazi",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          IconlyBold.star,
                                          color: Colors.yellow[800],
                                          size: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "4.7",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width:
                                          getScreenSize(context).width * 0.17,
                                    ),
                                    Text("\$ 55/Hour",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
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
