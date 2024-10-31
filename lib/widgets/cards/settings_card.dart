import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/provider/dark_mode_provider.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final Icon icontitle;
  final Color? strokeColor;
  final Color? IconColor;
  final Color? colortitle;
  final Color? ContainerColor;
  final Function ontap;
  const SettingsCard({
    super.key,
    required this.title,
    required this.icontitle,
    this.strokeColor,
    this.IconColor,
    this.ContainerColor,
    this.colortitle,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
        builder: (context, darkModeConsumer, child) {
      return GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
          height: getScreenSize(context).height * 0.08,
          width: getScreenSize(context).width,
          decoration: BoxDecoration(
            color: darkModeConsumer.isDark ? Color(0xff121212) : Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: ContainerColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: strokeColor ?? grayColor),
                ),
                child: icontitle,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                  color: darkModeConsumer.isDark ? Colors.white : Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              )
            ],
          ),
        ),
      );
    });
  }
}
