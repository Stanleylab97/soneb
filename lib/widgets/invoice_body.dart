import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar.dart';
import "package:flutter/material.dart";
import 'package:sonebpay/Models/facture.dart';
import 'package:sonebpay/Pages/PaymentsMethods.dart';
import 'package:sonebpay/Pages/screens.dart';
import 'package:sonebpay/config/MoMoRequests.dart';
import 'package:sonebpay/config/NetworkHandler.dart';
import 'package:sonebpay/config/constants.dart';
import 'package:uuid/uuid.dart';

class InvoiceBody extends StatelessWidget {
  final Facture facturedetails;

  InvoiceBody({this.facturedetails});
  @override
  Widget build(BuildContext context) {
    var totalAmount = facturedetails.montantFact;
    double height =
        ScreenConfig.deviceHeight - ScreenConfig.getProportionalHeight(374);
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConfig.getProportionalWidth(20)),
      color: iPrimarryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ScreenConfig.getProportionalHeight(20),
            ),
            Card(
              elevation: 1,
              child: Column(
                children: [
                  titre1(),
                  SousDetail1(facturedetails.compteur.numPolice,
                      int.parse(facturedetails.montantFact))
                ],
              ),
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(30),
            ),
            Card(
              elevation: 1,
              child: Column(
                children: [
                  titre2(),
                  SousDetail2(facturedetails.lastIndex, facturedetails.newIndex,
                      facturedetails.nbkwh, "B09")
                ],
              ),
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(4),
            ),
            invoiceTotal(int.parse(facturedetails.montantFact)),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(56),
            ),
            FlatButton(
              color: Color.fromRGBO(0, 91, 171, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SizedBox(
                height: ScreenConfig.getProportionalHeight(80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.payments,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: ScreenConfig.getProportionalWidth(21),
                    ),
                    Text(
                      "Payer maintenant",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenConfig.getProportionalHeight(27),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentsMethods()));
              },
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(37),
            ),
            Text("A payer avant le: " + facturedetails.periode.dateEcheance)
          ],
        ),
      ),
    );
  }

  Row titre1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          height: 50,
          color: Color.fromRGBO(24, 117, 154, 1),
          child: Center(
            child: Text(
              "NUMERO DE POLICE",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 150,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          height: 50,
          color: Color.fromRGBO(24, 117, 154, 1),
          child: Center(
            child: Text(
              "MONTANT A PAYER",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Row titre2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 75,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          height: 50,
          color: Color.fromRGBO(24, 117, 154, 1),
          child: Center(
            child: Text(
              "ANCIEN",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 74,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          height: 50,
          color: Color.fromRGBO(24, 117, 154, 1),
          child: Center(
            child: Text(
              "NOUVEAU",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          width: 79,
          height: 50,
          color: Color.fromRGBO(24, 117, 154, 1),
          child: Center(
            child: Text(
              "TOTAL(Kwh)",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 87,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          height: 50,
          color: Color.fromRGBO(24, 117, 154, 1),
          child: Center(
            child: Text(
              "Tranche(Kwh)",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Row invoiceTotal(int totalAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: ScreenConfig.getProportionalHeight(100),
          color: Colors.grey[300],
          child: Row(
            children: [
              Text(
                "NET A PAYER: ",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                width: ScreenConfig.getProportionalWidth(50),
              ),
              Text(
                "$totalAmount XOF",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }

  Container invoiceItem(
      int quantity, String imagePath, int price, String itemDesc) {
    int totalValue = quantity * price;

    return Container(
      height: ScreenConfig.getProportionalHeight(170),
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConfig.getProportionalWidth(27)),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 11),
                blurRadius: 11,
                color: Colors.black.withOpacity(0.06))
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quantity.toString(),
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
          Image.asset(imagePath),
          Text(
            "\$$price",
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: ScreenConfig.getProportionalWidth(145),
            child: Text(
              itemDesc,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "\$$totalValue",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class SousDetail1 extends StatelessWidget {
  String numCompteur;
  int montFact;
  SousDetail1(this.numCompteur, this.montFact);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 150,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        height: 50,
        color: Colors.grey[300],
        child: Center(
          child: Text(
            numCompteur,
            style: TextStyle(color: Colors.black38),
          ),
        ),
      ),
      Container(
        width: 150,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        height: 50,
        color: Colors.grey[300],
        child: Center(
          child: Text(
            "$montFact",
            style: TextStyle(color: Colors.black38),
          ),
        ),
      )
    ]);
  }
}

class SousDetail2 extends StatelessWidget {
  int lastIndex, newIndex, nbkwh;
  String tranche;
  SousDetail2(this.lastIndex, this.newIndex, this.nbkwh, this.tranche);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 75,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        height: 50,
        color: Colors.grey[300],
        child: Center(
          child: Text(
            "$lastIndex",
            style: TextStyle(color: Colors.black38),
          ),
        ),
      ),
      Container(
        width: 74,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        height: 50,
        color: Colors.grey[300],
        child: Center(
          child: Text(
            "$newIndex",
            style: TextStyle(color: Colors.black38),
          ),
        ),
      ),
      Container(
        width: 79,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        height: 50,
        color: Colors.grey[300],
        child: Center(
          child: Text(
            "$nbkwh",
            style: TextStyle(color: Colors.black38),
          ),
        ),
      ),
      Container(
        width: 87,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        height: 50,
        color: Colors.grey[300],
        child: Center(
          child: Text(
            tranche,
            style: TextStyle(color: Colors.black38),
          ),
        ),
      )
    ]);
  }
}

isConnected() async {
  return await DataConnectionChecker().connectionStatus;
  // actively listen for status update
}
