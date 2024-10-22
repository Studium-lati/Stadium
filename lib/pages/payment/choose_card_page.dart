import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/provider/reservations_provider.dart';
import 'package:stadium/widgets/cards/payment_card.dart';

class ChooseCardPage extends StatelessWidget {
  const ChooseCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationsProvider>(
      builder: (context,reservationsConsumer,_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Choose Card'),
          ),
          body: Center(
            child: SingleChildScrollView(
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
                    image: 'assets/Group 377.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  PaymentCard(
                    color: Colors.white,
                    image: "assets/mobicash.png",
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
