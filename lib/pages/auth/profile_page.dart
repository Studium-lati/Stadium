import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/settings_page.dart';
import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/provider/reservations_provider.dart';
import 'package:stadium/provider/staduim_provider.dart';
import 'package:stadium/widgets/cards/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Provider.of<AuthenProvider>(context, listen: false).getUser();
    Provider.of<ReservationsProvider>(context, listen: false)
        .fetchReservations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<AuthenProvider, ReservationsProvider, StaduimProvider>(
        builder: (context, authConsumer, reservationConsumer, stadiumConsumer,
            child) {
      return Scaffold(
        // backgroundColor: Colors.white,

        body: SafeArea(
          child: SingleChildScrollView(
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
                                      fit: BoxFit.cover,
                                      width: double.infinity);
                                },
                              ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 16,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                              ),
                              child: authConsumer.isLoading
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.black12,
                                      highlightColor: Colors.white38,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Container(
                                          color: Colors.white,
                                          width: getScreenSize(context).width *
                                              0.3,
                                          height:
                                              getScreenSize(context).height *
                                                  0.15,
                                        ),
                                      ))
                                  : CircleAvatar(
                                      radius: 65,
                                      backgroundImage: NetworkImage(
                                        authConsumer.userModel!.avatar ??
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUlsSgNMZa7wg18UgH_y77AkYwXctdbqzwLw&s",
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
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: reservationConsumer.isLoading
                        ? 3
                        : reservationConsumer.reservations.length,
                    itemBuilder: (context, index) {
                      return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: reservationConsumer.isLoading
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Shimmer.fromColors(
                                      baseColor: Colors.black12,
                                      highlightColor: Colors.white38,
                                      child: Container(
                                        color: Colors.white,
                                        width:
                                            getScreenSize(context).width * 0.9,
                                        height: getScreenSize(context).height *
                                            0.17,
                                      )),
                                )
                              : StadiumCard(
                                  title: stadiumConsumer.stadiums
                                      .firstWhere((element) =>
                                          element.id ==
                                          int.tryParse(reservationConsumer
                                                  .reservations[index]
                                                  .stadiumId ??
                                              ''))
                                      .name,
                                  date: reservationConsumer
                                      .reservations[index].date!
                                      .toIso8601String(),
                                  imagePath: stadiumConsumer.stadiums
                                      .firstWhere((element) =>
                                          element.id ==
                                          int.tryParse(reservationConsumer
                                                  .reservations[index]
                                                  .stadiumId ??
                                              ''))
                                      .image!,
                                  time: reservationConsumer
                                      .reservations[index].time!,
                                  price: reservationConsumer
                                      .reservations[index].price,
                                  deposit: (reservationConsumer
                                          .reservations[index].deposit ??
                                      'N/A'),
                                  duration: (reservationConsumer
                                          .reservations[index].duration ??
                                      'N/A'),
                                ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
