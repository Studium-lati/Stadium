import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/pages/auth/log_in_page.dart';
import 'package:stadium/widgets/icon_log_in.dart';
import 'package:stadium/widgets/main_button_widget.dart';
import 'package:stadium/widgets/text_clickable.dart';
import 'package:stadium/widgets/text_form_widget.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextForm(controller: _phoneController, labelText: "Phone"),
                SizedBox(
                  height: 26,
                ),
                TextForm(controller: _emailController, labelText: "Email"),
                SizedBox(
                  height: 26,
                ),
                TextForm(
                    controller: _passwordController, labelText: "Password"),
                SizedBox(
                  height: 26,
                ),
                TextForm(
                    controller: _confirmPasswordController,
                    labelText: "Confirm Password"),
                SizedBox(
                  height: 53,
                ),
                Mainbutton(text: "Sign up"),
                SizedBox(
                  height: 40,
                ),
                TextClickable(
                    text: "Already have an account",
                    function: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    }),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Or continue with',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconLogIn(image: 'assets/icons/google.png'),
                    SizedBox(width: 20),
                    IconLogIn(image: 'assets/icons/facebook.png'),
                    SizedBox(width: 20),
                    IconLogIn(
                        image: 'assets/icons/apple.png', height: 40, width: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
