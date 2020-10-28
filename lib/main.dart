import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sbeepay/Pages/Compteurs.dart';

import 'Pages/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SBEEPAY',
      debugShowCheckedModeBanner: false,
       routes: {
        Compteurs.routeName: (context)=>Compteurs(),
       },
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(size: 36.0, color: Colors.red),
      ),
      home: SplashScreen(),
    );
  }
}
