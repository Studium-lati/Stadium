import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check your email',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'We have sent a 6-digit code to your email address. Please enter the code below',
              style: TextStyle(fontSize: 14, color: grayColor),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                if (kDebugMode) {
                  print(value);
                }
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
            SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: Mainbutton(
                  text: "Verify Code",
                  ontap: () {},
                  paddingbutten: EdgeInsets.all(15),
                )),
            SizedBox(height: 20),
            Center(
              child: Row(
                children: [
                  Text(
                    'Haven not got the email yet? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  Text(
                    "Resend",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
