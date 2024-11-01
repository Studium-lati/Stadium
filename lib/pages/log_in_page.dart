import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/icon_log_in.dart';
import 'package:stadium/widgets/main_button_widget.dart';
import 'package:stadium/widgets/text_clickable.dart';
import 'package:stadium/widgets/text_form_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Login here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 26),
                    const Text(
                      'Welcome back you\'ve\n been missed!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 60),
                    TextForm(controller: _emailController, labelText: "Email"),
                    const SizedBox(height: 29),
                    TextForm(
                      controller: _passwordController,
                      labelText: "Password",
                      obscure: true,
                    ),
                    const SizedBox(height: 30),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextClickable(
                          text: "Forgot your password?",
                          function: () {},
                          color: primaryColor,
                        )),
                    const SizedBox(height: 30),
                    const Mainbutton(text: 'Sign in',paddingbutten: 16,),
                    const SizedBox(height: 40),
                    const Text(
                      'Create new account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 39),
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
                            image: 'assets/icons/apple.png',
                            height: 40,
                            width: 40),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
