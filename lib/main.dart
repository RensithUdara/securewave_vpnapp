import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_app/src/intro/intro_page.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Run the app
  runApp(VpnApp());
}

class VpnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VPN',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.white)),
      home: IntroPage(),
    );
  }
}
