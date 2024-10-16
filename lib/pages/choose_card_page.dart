import 'package:flutter/material.dart';
import 'package:stadium/widgets/cards/payment_card.dart';

class ChooseCardPage extends StatelessWidget {
  const ChooseCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PaymentCard(
              color: Color(0xFF823A7C),
              image: "assets/libany.png",
            ),
            SizedBox(height: 20),
            PaymentCard(
              color: Color(0xFF75A736),
              image: "assets/image.png",
            ),
            SizedBox(height: 20),
            PaymentCard(
              color: Colors.white,
              image: "assets/mobicash.png",
            ),
          ],
        ),
      ),
    );
  }
}
