import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function ontap;
  const MessageInputField({super.key, 
    required this.controller,
    required this.ontap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: primaryColor),
            onPressed: () {
              ontap();
            },
          ),
        ],
      ),
    );
  }
}
