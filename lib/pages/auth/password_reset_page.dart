import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';





class PasswordResetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password reset',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your password has been successfully reset. Click confirm to set a new password.',
              style: TextStyle(fontSize: 16, color:grayColor),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child:Mainbutton(text: "Confirm", ontap: (){})
              ),
          ]
            ),
    
          
        ),
      
    );
  }
}
