import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/models/staduim_model.dart';
import 'package:stadium/pages/main/checkout_page.dart';
import 'package:stadium/provider/favorite_provider.dart';
import 'package:stadium/provider/reservations_provider.dart';

class StadiumDetailsCard extends StatefulWidget {
  final StadiumsModel stadium;

  const StadiumDetailsCard({
    super.key,
    required this.stadium,
  });

  @override
  State<StadiumDetailsCard> createState() => _StadiumDetailsCardState();
}

class _StadiumDetailsCardState extends State<StadiumDetailsCard> {
  @override
  void initState() {
    Provider.of<FavoriteProvider>(context, listen: false).getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<FavoriteProvider, ReservationsProvider>(
        builder: (context, favoriteConsumer, reservationConsumer, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: getScreenSize(context).width,
                height: getScreenSize(context).height * 0.6,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                  image: DecorationImage(
                    image: NetworkImage(widget.stadium.image!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(favoriteConsumer.favoriteModel.any((favorite) =>
                            favorite.stadiumId.toString() ==
                            widget.stadium.id.toString())
                        ? Icons.bookmark_outlined
                        : Icons.bookmark_border),
                    onPressed: () {
                      setState(() {
                        favoriteConsumer.addFavorite({
                          "stadium_id": widget.stadium.id.toString(),
                        }).then((updateed) {
                          if (updateed) {
                            setState(() {
                              favoriteConsumer.getFavorite();
                            });
                          }
                        });
                      });
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: getScreenSize(context).width,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                      top: getScreenSize(context).height * 0.52),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(36)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.stadium.name,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '\$${widget.stadium.pricePerHour}/Hour',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Overview",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  // ignore: deprecated_member_use
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                  // changes position of shadow
                                )
                              ]),
                              // width: getScreenSize(context).width * 0.3,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(8),
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(IconlyBold.location,
                                        color: Colors.white),
                                    SizedBox(width: 16),
                                    Text(widget.stadium.location,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    IconlyBold.star,
                                    color: Color(0xFFFFD233),
                                    size: 24,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    " RATING \n ${widget.stadium.rating.toString().substring(0, 3)} out of 5.0",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.stadium.description ??
                              'the best stadium in the world',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        SizedBox(height: 14),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              reservationConsumer.reservationsModel.stadiumId =
                                  widget.stadium.id.toString();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckoutPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal:
                                      getScreenSize(context).width * 0.3),
                            ),
                            child: Text(
                              'Book Now',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}