import 'package:flutter/material.dart';

class IconLogIn extends StatelessWidget {
  const IconLogIn({
  super.key, 
  required this.image, 
  this.height, 
  this.width});
  
  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 50,
      height: height ?? 50,
      child: IconButton(
        icon: Image.asset(image),
        onPressed: () {},
      ),
    );
  }
}
