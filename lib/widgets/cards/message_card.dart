import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final bool isSender;
  final String message;

  MessageCard({
    required this.isSender,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
       
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isSender ? Colors.green[50] : Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.black),
          ),
        ),
        
      ],
    );
  }
}