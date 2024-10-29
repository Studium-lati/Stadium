import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/payment/payment_confirmation.dart';

import 'package:stadium/provider/reservations_provider.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsCodePage extends StatefulWidget {
  const SmsCodePage({super.key});

  @override
  State<SmsCodePage> createState() => _SmsCodePageState();
}

class _SmsCodePageState extends State<SmsCodePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationsProvider>(
        builder: (context, reservationsConsumer, _) {
      return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(
              bottom: 0,
              left: 20,
              right: 0,
              top: 20,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 60,
                  left: 50,
                  right: 50,
                  top: 80,
                ),
                child: Text(
                  "SMS Code",
                  style: TextStyle(
                      fontSize: 36,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "code",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {
                      print(value);
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeColor: primaryColor,
                      inactiveColor: grayColor,
                      fieldOuterPadding: EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getScreenSize(context).height * 0.08,
            ),
            SizedBox(
              width: getScreenSize(context).width * 0.7,
              height: getScreenSize(context).height * 0.065,
              child: Mainbutton(
                text: 'Enter code',
                ontap: () {
                  Provider.of<ReservationsProvider>(context, listen: false)
                      .reserveStadium();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentConfirmation()),
                  );
                },
                backgroundColor: primaryColor,
                borderbutton: BorderRadius.circular(12),
              ),
            )
          ],
        ),
      );
    });
  }
}
