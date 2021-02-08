import 'package:flutter/material.dart';
import 'package:sonebpay/config/constants.dart';

class Compteurs extends StatefulWidget {
  static const routeName = "compteurs";
  @override
  _CompteursState createState() => _CompteursState();
}

class _CompteursState extends State<Compteurs> {
  TextEditingController _abonne = TextEditingController();
  TextEditingController _police = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
              top: 30.0, bottom: 10.0, right: 15.0, left: 15.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildTitleSection(title: "Mes compteurs"),
              _buildCreditCard(
                  color: Colors.grey[400],
                  cardExpiration: "AB07891",
                  cardHolder: "ABOU Aliou",
                  cardNumber: "GD 22788"),
              SizedBox(
                height: 15,
              ),
              _buildCreditCard(
                  color: Colors.grey[400],
                  cardExpiration: "AB13780",
                  cardHolder: "John DOE",
                  cardNumber: "HE 68345"),
              SizedBox(
                height: 15,
              ),
              _buildCreditCard(
                  color: Colors.grey[400],
                  cardExpiration: "AB53710",
                  cardHolder: "John DOE",
                  cardNumber: "TK 29345"),
              SizedBox(
                height: 15,
              ),
              _buildAddCardButton(
                icon: Icon(Icons.add),
                color: Color.fromRGBO(0, 91, 171, 1),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Build the title section
  Column _buildTitleSection({@required title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: Text(
            '$title',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
      ],
    );
  }

  // Build the credit card widget
  Card _buildCreditCard(
      {@required Color color,
      @required String cardNumber,
      @required String cardHolder,
      @required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 130,
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 22.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Police n° $cardNumber',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CLIENT',
                  value: cardHolder,
                ),
                _buildDetailsBlock(
                    label: 'Numéro Abonné', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/logo.jpeg",
          height: 24,
          width: 20,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({@required String label, @required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

// Build the FloatingActionButton
  Container _buildAddCardButton({
    @required Icon icon,
    @required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: FloatingActionButton(
        elevation: 8.0,
        onPressed: () {
          _displayDialog(context);
        },
        backgroundColor: color,
        mini: false,
        child: icon,
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Veuillez entrer vos références',
                textAlign: TextAlign.center),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  TextField(
                    controller: _police,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration:
                        InputDecoration(hintText: "Numéro police: XXXXXXX"),
                  ),
                  TextField(
                    controller: _abonne,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration:
                        InputDecoration(hintText: "Numéro abonné: ABXXXXX"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Ajouter'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
