import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/text_form_widget.dart';



class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
        final TextEditingController _phoneController = TextEditingController();
          final TextEditingController _emailController = TextEditingController();




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
      body: SingleChildScrollView(
        child: Padding(
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
                          return 'Please enter your phone number';
                        }
                        if (value.length < 10) {
                          return 'Password must be at least 10 characters';
                        }
                        return null;
                  }, labelText: 'Enter phone number',
                  controller: _phoneController,),
                  SizedBox(height: 20),
              
             TextForm( 
              controller: _emailController,
              
               validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },labelText: "Enter your  email", suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility 
                    ),
                    onPressed: () {
                     
                    },)
                 
                  ),
                
              
              SizedBox(height: 20),
               TextForm( 
                controller: _passwordController,
                
                 validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },labelText: " password", suffixIcon: IconButton(
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
        ),
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
