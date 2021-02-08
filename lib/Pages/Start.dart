import 'package:firebase_auth/firebase_auth.dart';
import 'package:sonebpay/Pages/sign_in.dart';
import 'package:sonebpay/config/palette.dart';
import 'package:sonebpay/Pages/BottomNavScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Login.dart';
import 'SignUp.dart';
import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;

  bool isUserSignedIn = false;

  String _contactText;

  @override
  void initState() {
    super.initState();
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  Future<User> _handleSignIn() async {
    User user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    User user = await _handleSignIn();
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavScreen()),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }

  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToRegister() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              child: Image(
                image: AssetImage("assets/images/start.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 1),
            RichText(
                text: TextSpan(
                    text: 'Bienvenue sur ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'SONEB PAY',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 91, 171, 1)))
                ])),
            SizedBox(height: 10.0),
            Text(
              'L\'application qui fait gagner du temps',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToLogin,
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.green[500]),
                SizedBox(width: 20.0),
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToRegister,
                    child: Text(
                      'S\'enregistrer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blue[400]),
              ],
            ),
            SizedBox(height: 25.0),
            /* SignInButton(
              Buttons.Google,
              text: "Se connecter avec Google",
              onPressed:() {onGoogleSignIn(context);},
              elevation: 8.0,
            ) */
          ],
        ),
      ),
    );
  }
}
