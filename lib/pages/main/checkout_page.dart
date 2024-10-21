import 'package:flutter/material.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/payment/choose_card_page.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TimeOfDay? checkinTime;
  TimeOfDay? checkoutTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "date",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  onDateChanged: (onDateChanged) {}),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15),
                child: Text(
                  "Time",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((onValue) {
                      setState(() {
                        if (onValue != null &&
                            (onValue.hour > TimeOfDay.now().hour ||
                                (onValue.hour == TimeOfDay.now().hour &&
                                    onValue.minute > TimeOfDay.now().minute))) {
                          checkinTime = onValue;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Check-in time must be in the future'),
                            ),
                          );
                        }
                      });
                    });
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: TextEditingController(
                      text: checkinTime != null
                          ? '${checkinTime!.hour} : 00'
                          : 'Checkin Time',
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((onValue) {
                      setState(() {
                        if (onValue != null &&
                            (checkinTime == null ||
                                onValue.hour > checkinTime!.hour ||
                                (onValue.hour == checkinTime!.hour &&
                                    onValue.minute > checkinTime!.minute))) {
                          checkoutTime = onValue;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Checkout time must be after check-in time'),
                            ),
                          );
                        }
                      });
                    });
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: TextEditingController(
                      text: checkoutTime != null
                          ? '${checkoutTime!.hour} : 00'
                          : 'Checkout Time',
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: getScreenSize(context).width,
                    height: getScreenSize(context).height * 0.08,
                    child: Mainbutton(
                      text: "Book know",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseCardPage()));
                      },
                      textsize: 16,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
