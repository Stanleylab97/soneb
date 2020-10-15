import 'package:flutter/material.dart';

import 'Pages/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SBEEPAY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(size: 36.0, color: Colors.red),
      ),
      home: SplashScreen(),
    );
  }
}
