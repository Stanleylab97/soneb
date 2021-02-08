import 'package:firebase_auth/firebase_auth.dart';
import 'package:sonebpay/config/constants.dart';
import 'package:sonebpay/config/palette.dart';
import 'package:sonebpay/Pages/BottomNavScreen.dart';
import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const MyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Palette.primaryColor,
              Palette.primaryColor,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/info.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BottomNavScreen();
                    },
                  ),
                );
              },
              child: Image.asset("assets/icons/menu.png"),
            ),
            SizedBox(height: 140),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: Image.asset(
                      widget.image,
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),

                  Positioned(
                    top: 20 - widget.offset / 2,
                    left: 100,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                          color: Colors.white, fontSize: 19.0),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
