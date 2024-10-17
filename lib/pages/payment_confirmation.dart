import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';


class PaymentConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:   Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),iconSize: 30,
                    onPressed: () {
                    },
                  ),
                  Text(
                    'Payment Confirmation',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            CircleAvatar(
              radius: 100,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.check,
                size: 120,
                color: Colors.white,
              ),
            ),
            SizedBox(  height: getScreenSize(context).height * 0.06,),
            Text(
              'Payment Successful',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}