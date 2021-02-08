import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:sonebpay/config/styles.dart';
import 'package:sonebpay/widgets/custom_app_bar.dart';
import 'package:sonebpay/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final data = [15.0, 25.0, 23.0, 35.0, 27.0, 18.0, 25.0, 21.0];
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
        color: Color.fromRGBO(0, 91, 171, 1),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Bienvenue à la SONEB",
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
            Text('Société Nationale des Eaux du Bénin',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: screenHeight * 0.03),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                    label: Text("Dépannage", style: Styles.buttonTextStyle),
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
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 91, 171, 1),
          Color.fromRGBO(97, 199, 242, 1)
        ]),
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
            Text("La SONEB",
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
