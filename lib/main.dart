import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/pages/auth/Set_newpassword_page.dart';
import 'package:stadium/pages/auth/splash_page.dart';
import 'package:stadium/pages/event_detail.dart';
import 'package:stadium/pages/fillter_page.dart';


import 'package:stadium/pages/payment_confirmation.dart';
import 'package:stadium/pages/profile_page.dart';
import 'package:stadium/pages/settings_page.dart';
import 'package:stadium/pages/sms_code_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

       theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
       ),
        
        home: FilterScreen());
  }
}
