import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/settings_page.dart';
import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/widgets/cards/profile_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Provider.of<AuthenProvider>(context, listen: false).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context, authConsumer, child) {
      return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              color: grayColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              color: grayColor,
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getScreenSize(context).height * 0.3,
                child: Stack(
                  children: [
                    SizedBox(
                      height: getScreenSize(context).height * 0.23,
                      width: double.infinity,
                      child: authConsumer.isLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white38,
                              child: Container(
                                color: Colors.white,
                                width: getScreenSize(context).width * 0.6,
                                height: getScreenSize(context).height * 0.7,
                              ))
                          : Image.network(
                              authConsumer.userModel!.cover ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/image_tot.png',
                                    fit: BoxFit.cover, width: double.infinity);
                              },
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 16,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: authConsumer.isLoading
                                ? Shimmer.fromColors(
                                    baseColor: Colors.black12,
                                    highlightColor: Colors.white38,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        color: Colors.white,
                                        width:
                                            getScreenSize(context).width * 0.3,
                                        height: getScreenSize(context).height *
                                            0.15,
                                      ),
                                    ))
                                : CircleAvatar(
                                    radius: 65,
                                    backgroundImage: NetworkImage(
                                      authConsumer.userModel!.avatar ?? "",
                                    ),
                                  ),
                          ),
                          SizedBox(width: 12.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 76.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  authConsumer.isLoading
                                      ? 'Loading...'
                                      : authConsumer.userModel!.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Booking History',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: getScreenSize(context).height * 0.5,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    StadiumCard(
                      title: 'old trafold',
                      date: '28_1_2005',
                      imagePath:
                          'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                    ),
                    StadiumCard(
                      title: 'old trafold',
                      date: '28_1_2005',
                      imagePath:
                          'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                    ),
                    StadiumCard(
                      title: 'old trafold',
                      date: '28_1_2005',
                      imagePath:
                          'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                    ),
                    StadiumCard(
                      title: 'old trafold',
                      date: '28_1_2005',
                      imagePath:
                          'assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
