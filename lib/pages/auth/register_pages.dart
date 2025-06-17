import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/main.dart';
import 'package:stadium/pages/auth/log_in_page.dart';
import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/widgets/clickables/icon_log_in.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/clickables/text_clickable.dart';
import 'package:stadium/widgets/inputs/text_form_widget.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _otpController =
      TextEditingController(); // Added OTP controller
  bool _obscureText = true;
  bool _showOtpForm = false; // To toggle between registration and OTP form

  // Method to handle sending OTP
  Future<void> _sendOtp() async {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your phone number.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final authProvider = Provider.of<AuthenProvider>(context, listen: false);
    final result =
        await authProvider.sendOtp(_phoneController.text, 'registration');
    if (result[0]) {
      setState(() {
        _showOtpForm = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result[1]),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result[1]),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Method to handle verifying OTP and then registering the user
  Future<void> _verifyOtpAndRegister() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthenProvider>(context, listen: false);
      final otpResult = await authProvider.verifyOtp(
          _phoneController.text, _otpController.text);

      if (otpResult[0]) {
        // OTP verified, proceed to register
        final userDetails = {
          'name': _nameController.text.toString(),
          'email': _emailController.text.toString(),
          // Add any other user details required by your API
          'role': 'user',
        };
        final registerResult = await authProvider.registerUser(
          _phoneController.text.toString(),
          _passwordController.text.toString(),
          userDetails,
        );

        if (registerResult[0]) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(registerResult[1]),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ScreenRouter()),
              (Route<dynamic> route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(registerResult[1]),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // OTP verification failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(otpResult[1]),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context, authConsumer, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: _showOtpForm
                    ? _buildOtpForm(authConsumer)
                    : _buildRegisterForm(authConsumer),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildRegisterForm(AuthenProvider authConsumer) {
    return Column(
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
          height: 30,
        ),
        TextForm(
          controller: _nameController,
          labelText: "Name",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextForm(
          controller: _phoneController,
          labelText: "Phone",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            // Basic phone number validation (you might want a more robust one)
            if (!RegExp(r'^[0-9]{10,}$').hasMatch(value)) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextForm(
          controller: _emailController,
          labelText: "Email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextForm(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          controller: _passwordController,
          labelText: "Password",
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          obscure: _obscureText,
        ),
        SizedBox(
          height: 20,
        ),
        TextForm(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          controller: _confirmPasswordController,
          labelText: "Confirm Password",
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          obscure: _obscureText,
        ),
        SizedBox(
          height: 40,
        ),
        Mainbutton(
          text: "Send OTP",
          ontap: () {
            if (_formKey.currentState!.validate()) {
              _sendOtp();
            }
          },
        ),
        SizedBox(
          height: 20,
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
              fontSize: 14, color: primaryColor, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconLogIn(image: 'assets/icons/google.png'),
            SizedBox(width: 20),
            IconLogIn(image: 'assets/icons/facebook.png'),
            SizedBox(width: 20),
            IconLogIn(image: 'assets/icons/apple.png', height: 40, width: 40),
          ],
        ),
      ],
    );
  }

  Widget _buildOtpForm(AuthenProvider authConsumer) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 60,
        ),
        Text(
          'Verify OTP',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'An OTP has been sent to ${_phoneController.text}. Please enter it below.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        TextForm(
          controller: _otpController,
          labelText: "OTP Code",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the OTP';
            }
            return null;
          },
        ),
        SizedBox(
          height: 40,
        ),
        Mainbutton(
          text: "Verify OTP & Register",
          ontap: _verifyOtpAndRegister,
        ),
        SizedBox(
          height: 20,
        ),
        TextClickable(
          text: "Back to registration",
          function: () {
            setState(() {
              _showOtpForm = false;
            });
          },
        ),
      ],
    );
  }
}
