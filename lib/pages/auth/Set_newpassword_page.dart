import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/text_form_widget.dart';



class SetNewPasswordScreen extends StatefulWidget {
  @override
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set a new password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Create a new password. Ensure it differs from previous ones for security',
              style: TextStyle(color: grayColor),
            ),
            SizedBox(height: 35),
           TextForm(  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },labelText: "Enter your new password", suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility 
                  ),
                  onPressed: () {
                   
                  },)
               
                ),
              
            
            SizedBox(height: 20),
             TextForm(  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },labelText: "Re-enter password", suffixIcon: IconButton(
                  icon: Icon(
                   Icons.visibility  
                  ),
                  onPressed: () {
                  
                    
                  },)
               
                ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child:Mainbutton(text:"Update Password" , ontap: (){},paddingbutten: EdgeInsets.all(15),)
              
              
            
        
        ),
        ]
      
      )
      )
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
