import 'package:flutter/material.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/pages/main/pymentmethod_page.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key, required this.color, required this.image, this.fit});
  final Color color;
  final String image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PaymentScreen(image: image);
        }));
      },
      child: Container(
        height: getScreenSize(context).height * 0.25,
        width: getScreenSize(context).width * 0.8,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: color,
          shadows: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getScreenSize(context).width * 0.45,
              height: getScreenSize(context).height * 0.15,
              child: Image(
                  image: AssetImage(image),
                  fit: fit ?? BoxFit.contain,
                  alignment: Alignment.center),
            ),
          ],
        ),
      ),
    );
  }
}
