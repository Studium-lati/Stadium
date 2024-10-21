import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/text_form_widget.dart';



class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:primaryColor),
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your email to reset the password',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Your Email',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
             TextForm(labelText: "Enter your Email", controller: _emailController,
             
              validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },

                      
                      ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child:Mainbutton(text: "Reset Password", ontap: (){})
              ),
            ],
          ),
        ),
      ),
    );
  }
}
