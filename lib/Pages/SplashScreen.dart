import 'dart:async';
import 'package:sonebpay/Pages/BottomNavScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sonebpay/Pages/Start.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();
  Widget page;

  @override
  void initState() {
    super.initState();
    checkLogin();
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
            (route) => false));
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = BottomNavScreen();
      });
    } else {
      setState(() {
        page = Start();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(244, 244, 234, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                MyImage(),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30.0),
                  SpinKitWanderingCubes(
                      itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? Color.fromRGBO(0, 91, 171, 1)
                            : Color.fromRGBO(205, 126, 80, 1),
                      ),
                    );
                  }),
                  SizedBox(height: 50.0),
                  Text("Powered by ALL PAY",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Colors.black45))
                ],
              ))
        ],
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage image = new AssetImage("assets/images/logo.jpg");
    Image logo = new Image(image: image, width: 200, height: 200);
    return logo;
  }
}
