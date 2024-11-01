// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/provider/reservations_provider.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/text_form_widget.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final TextEditingController _numberOfPlayersController =
      TextEditingController();
  final TextEditingController _preferredTimeController =
      TextEditingController();
  final TextEditingController _preferredDateController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isAvailable = false;
  bool acceptRequist = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationsProvider>(
        builder: (context, matchConsumer, child) {
      return Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Match Generation",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Random Match Request",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: secondaryColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextForm(
                      enabled: !isAvailable,
                      labelText: "Number of Players",
                      keyboardType: TextInputType.number,
                      controller: _numberOfPlayersController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the number of players";
                        }

                        if (int.parse(value) < 4) {
                          return "Number of players must be greater than 4";
                        }
                        if (int.parse(value) > 12) {
                          return "Number of players must be less than 12";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!isAvailable) {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365)));
                          if (date != null) {
                            _preferredDateController.text =
                                date.toString().substring(0, 10);
                          }
                        }
                      },
                      child: TextForm(
                          labelText: "Preferred Date",
                          enabled: false,
                          controller: _preferredDateController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the preferred date";
                            }

                            return null;
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!isAvailable) {
                          TimeOfDay? time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            _preferredTimeController.text =
                                time.format(context);
                            final now = DateTime.now();
                            final selectedDateTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              time.hour,
                              time.minute,
                            );

                            if (selectedDateTime.isAfter(now)) {
                              _preferredTimeController.text =
                                  time.format(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Preferred time must be in the future'),
                                ),
                              );
                            }
                                                    }
                        }
                      },
                      child: TextForm(
                          enabled: false,
                          labelText: "Preferred Time",
                          keyboardType: TextInputType.datetime,
                          controller: _preferredTimeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the preferred time";
                            }
                            return null;
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Switch(
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey[300],
                            value: isAvailable,
                            onChanged: (value) {
                              setState(() {
                                _numberOfPlayersController.clear();
                                _preferredDateController.clear();
                                _preferredTimeController.clear();

                                isAvailable = value;
                              });
                            }),
                        // SizedBox(width: 30),
                        Text("Available All day?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor)),
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: SizedBox(
                        width: double.infinity,
                        child: Mainbutton(
                          ontap: () {
                            Provider.of<ReservationsProvider>(context,
                                    listen: false)
                                .randomMatchRequest({
                              "number_of_players":
                                  _numberOfPlayersController.text,
                              "preferred_date": _preferredDateController.text,
                              "preferred_time": _preferredTimeController.text,
                              "is_available_all_days": isAvailable ? "1" : "0",
                            }).then((onValue) {
                              setState(() {
                                acceptRequist = onValue[0];
                                
                              });
                            });
                            // acceptRequist = !acceptRequist;

                            // acceptRequist = !acceptRequist;
                            if (!isAvailable) {
                              if (_formKey.currentState!.validate()) {
                                // Do something
                              }
                            }
                          },
                          text: "Generate Match",
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (acceptRequist)
                      Text("We found a match for you",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    SizedBox(height: 20),
                  
                    if (acceptRequist)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  matchConsumer.matchModel!.user1.avatar ??
                                      "https://pigeon-wanted-wildcat.ngrok-free.app/storage/avatars/1729413494.jpg",
                                  width: getScreenSize(context).width * 0.3,
                                  height: getScreenSize(context).height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  matchConsumer.matchModel!.user1.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ],
                          ),
                          Text("VS",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryColor)),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              children: [
                                Image.network(
                                  matchConsumer.matchModel!.user2.avatar ??
                                      "https://pigeon-wanted-wildcat.ngrok-free.app/storage/avatars/1729413494.jpg",
                                  width: getScreenSize(context).width * 0.3,
                                  height: getScreenSize(context).height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    matchConsumer.matchModel!.user2.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 20),
                    if (acceptRequist)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: SizedBox(
                          width: double.infinity,
                          child: Mainbutton(
                            ontap: () {},
                            text: "Chat Now",
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
