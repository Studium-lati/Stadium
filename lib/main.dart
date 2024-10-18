import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/pages/auth/log_in_page.dart';
import 'package:stadium/pages/auth/splash_page.dart';
import 'package:stadium/pages/main/home_page.dart';

import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/provider/base_provider.dart';
import 'package:stadium/provider/staduim_provider.dart';

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
        ChangeNotifierProvider(
            create: (context) => StaduimProvider()..getStaduim()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashPage(),
      ),
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
      return authConsumer.authenticated ? const TabsScreen() : LogInPage();
    });
  }
}
