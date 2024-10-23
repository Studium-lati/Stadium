import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/pages/auth/log_in_page.dart';
import 'package:stadium/pages/auth/splash_page.dart';
import 'package:stadium/pages/main/home_page.dart';
import 'package:stadium/pages/onbording/onbording1.dart';
import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/provider/base_provider.dart';
import 'package:stadium/provider/dark_mode_provider.dart';

import 'package:stadium/provider/event_provider.dart';
import 'package:stadium/provider/favorite_provider.dart';
import 'package:stadium/provider/staduim_provider.dart';

import 'package:stadium/provider/reservations_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseProvider()),
        ChangeNotifierProvider(create: (context) => AuthenProvider()),
        ChangeNotifierProvider(create: (context) => StaduimProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => ReservationsProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(
            create: (context) => DarkModeProvider()..getMode()),
      ],
      child: Consumer<DarkModeProvider>(
          builder: (context, darkModeConsumer, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor:
                    darkModeConsumer.isDark ? Color(0xff121212) : Colors.white,
                elevation: 0),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor:
                  darkModeConsumer.isDark ? Color(0xff121212) : Colors.white,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor:
                darkModeConsumer.isDark ? Color(0xff121212) : Colors.white,
          ),
          home: SplashPage(),
        );
      }),
    );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthenProvider>(context, listen: false)
        .initializeAuthProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context, authConsumer, child) {
      return authConsumer.authenticated ? const Onbording1() : LogInPage();
    });
  }
}
