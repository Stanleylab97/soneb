import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:sbeepay/config/styles.dart';
import 'package:sbeepay/widgets/custom_app_bar.dart';
import 'package:sbeepay/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final data = [35.0, 60.0, 50.0, 40.0, 35.0, 55.0, 70.0, 40.0];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            _buildHeader(screenHeight, context),
            SizedBox(height: 8),
            Center(
              child: Graphe(width: width, data: data),
            ),
            _buildMessage(screenHeight)
          ],
        )));
  }
}

class Graphe extends StatelessWidget {
  const Graphe({
    Key key,
    @required this.width,
    @required this.data,
  }) : super(key: key);

  final double width;
  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: 300,
      width: width * 0.8,
      depth: 12,
      spread: 8,
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 26,
            ),
            child: Text(
              "Evaluation de votre consommation",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Chart(
            data: data,
          ),
        ],
      ),
    );
  }
}

Widget _buildHeader(double screenHeight, BuildContext context) {
  return Container(
      child: Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Bienvenue",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Column(
          children: <Widget>[
            Text('Société Béninoise d\'Energie Electrique',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: screenHeight * 0.01),
            Text('Les Experts en fourniture d\'Electricté',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    onPressed: () {
                      launch("tel:911");
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    icon: const Icon(Icons.call),
                    label: Text("Appeler", style: Styles.buttonTextStyle),
                    textColor: Colors.white),
                FlatButton.icon(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    onPressed: () {
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => AlertScreen()));
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    icon: const Icon(
                      Icons.notifications_active,
                      color: Colors.yellow,
                    ),
                    label: Text("Alertez-nous", style: Styles.buttonTextStyle),
                    textColor: Colors.white),
              ],
            )
          ],
        )
      ],
    ),
  ));
}

Widget _buildMessage(double screenHeight) {
  return Container(
      child: Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    padding: const EdgeInsets.all(10.0),
    height: screenHeight * 0.15,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.yellow, Colors.red]),
        borderRadius: BorderRadius.circular(20.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset(
          'assets/images/compteur.jpg',
          width: 90,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("La SBEE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Nous donnons le meilleur de\nnous pour vous servir 24h/24",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              maxLines: 3,
            )
          ],
        )
      ],
    ),
  ));
}
