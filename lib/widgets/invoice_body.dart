import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar.dart';
import "package:flutter/material.dart";
import 'package:sbeepay/Pages/screens.dart';
import 'package:sbeepay/config/MoMoRequests.dart';
import 'package:sbeepay/config/NetworkHandler.dart';
import 'package:sbeepay/config/constants.dart';
import 'package:uuid/uuid.dart';

class InvoiceBody extends StatelessWidget {
  MoMoRequests moMoRequests;
  @override
  Widget build(BuildContext context) {
    var totalAmount = 6574;
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
                children: [titre1(), SousDetail1("GD22788", 6574)],
              ),
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(30),
            ),
            Card(
              elevation: 1,
              child: Column(
                children: [titre2(), SousDetail2(1158, 1274, 24, "B09")],
              ),
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(4),
            ),
            invoiceTotal(totalAmount),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(56),
            ),
            FlatButton(
              color: iAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SizedBox(
                height: ScreenConfig.getProportionalHeight(80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.payments),
                    SizedBox(
                      width: ScreenConfig.getProportionalWidth(21),
                    ),
                    Text(
                      "Payer maintenant",
                      style: TextStyle(
                          fontSize: ScreenConfig.getProportionalHeight(27),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Ex: 66XXXXXX'),
                                ),
                                SizedBox(
                                  width: 320.0,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      Flushbar(
                                          title: "Hey Ninja",
                                          message:
                                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          flushbarStyle: FlushbarStyle.FLOATING,
                                          reverseAnimationCurve:
                                              Curves.decelerate,
                                          forwardAnimationCurve:
                                              Curves.elasticOut,
                                          backgroundColor: Colors.red,
                                          boxShadows: [
                                            BoxShadow(
                                                color: Colors.blue[800],
                                                offset: Offset(0.0, 2.0),
                                                blurRadius: 3.0)
                                          ],
                                          backgroundGradient: LinearGradient(
                                              colors: [
                                                Colors.blueGrey,
                                                Colors.black
                                              ]),
                                          isDismissible: false,
                                          duration: Duration(seconds: 4),
                                          icon: Icon(
                                            Icons.info_outline,
                                            color: Colors.greenAccent,
                                          ),
                                          mainButton: FlatButton(
                                            onPressed: () {},
                                            child: Text(
                                              "BAD",
                                              style: TextStyle(
                                                  color: Colors.amber),
                                            ),
                                          ),
                                          showProgressIndicator: true,
                                          progressIndicatorBackgroundColor:
                                              Colors.blueGrey,
                                          titleText: Text(
                                            "Connexion impossible",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                color: Colors.yellow[600],
                                                fontFamily:
                                                    "ShadowsIntoLightTwo"),
                                          ),
                                          messageText: Text(
                                            "Facture réglée  avec succès! ",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.green,
                                                fontFamily:
                                                    "ShadowsIntoLightTwo"),
                                          ));
                                      /* DataConnectionStatus status =
                                          await isConnected();
                                      if (status ==
                                          DataConnectionStatus.connected) {
                                        var uuid = Uuid();
                                        Map<String, dynamic> data = {
                                          "amount": 1000,
                                          "currency": "EUR",
                                          "externalId": "factureId",
                                          "payer": {
                                            "partyIdType": "MSISDN",
                                            "partyId": "string"
                                          },
                                          "payerMessage": "Pay bill",
                                          "payeeNote": "Electric bill payed"
                                        };

                                        String refId = uuid.v4();
                                        var response = await moMoRequests
                                            .requestToPay(refId, data);

                                        if (response.statusCode == 200 ||
                                            response.statusCode == 201) {
                                          Map<String, dynamic> output =
                                              json.decode(response.body);

                                          setState(() {
                                            validate = true;
                                            circular = false;
                                          });
                                          print('Login Ok');
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UnpaidBills(),
                                              ),
                                              (route) => false);
                                        } else {
                                          //Map<String, String> output = json.decode(response.body);
                                          setState(() {
                                            validate = false;
                                            //errorText = output['status'];
                                            circular = false;
                                            print(response.statusCode);
                                            print("Login Bad");
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          circular = false;
                                        });
                                        print("No internet");
                                        Flushbar(
                                            title: "Hey Ninja",
                                            message:
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            flushbarStyle:
                                                FlushbarStyle.FLOATING,
                                            reverseAnimationCurve:
                                                Curves.decelerate,
                                            forwardAnimationCurve:
                                                Curves.elasticOut,
                                            backgroundColor: Colors.red,
                                            boxShadows: [
                                              BoxShadow(
                                                  color: Colors.blue[800],
                                                  offset: Offset(0.0, 2.0),
                                                  blurRadius: 3.0)
                                            ],
                                            backgroundGradient: LinearGradient(
                                                colors: [
                                                  Colors.blueGrey,
                                                  Colors.black
                                                ]),
                                            isDismissible: false,
                                            duration: Duration(seconds: 4),
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Colors.greenAccent,
                                            ),
                                            mainButton: FlatButton(
                                              onPressed: () {},
                                              child: Text(
                                                "BAD",
                                                style: TextStyle(
                                                    color: Colors.amber),
                                              ),
                                            ),
                                            showProgressIndicator: true,
                                            progressIndicatorBackgroundColor:
                                                Colors.blueGrey,
                                            titleText: Text(
                                              "Connexion impossible",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                  color: Colors.yellow[600],
                                                  fontFamily:
                                                      "ShadowsIntoLightTwo"),
                                            ),
                                            messageText: Text(
                                              "Vérifiez votre connexion internet!",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.green,
                                                  fontFamily:
                                                      "ShadowsIntoLightTwo"),
                                            ));
                                      } */
                                    },
                                    child: Text(
                                      "Défalquer",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: const Color(0xFF1BC0C5),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            )
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
          color: Colors.pink[600],
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
          color: Colors.pink[600],
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
          color: Colors.pink[600],
          child: Center(
            child: Text(
              "ANCIEN",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 50,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          height: 50,
          color: Colors.pink[600],
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
          color: Colors.pink[600],
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
          color: Colors.pink[600],
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
          color: Colors.pink[200],
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
        color: Colors.pink[200],
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
        color: Colors.pink[200],
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
        color: Colors.pink[200],
        child: Center(
          child: Text(
            "$lastIndex",
            style: TextStyle(color: Colors.black38),
          ),
        ),
      ),
      Container(
        width: 50,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        height: 50,
        color: Colors.pink[200],
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
        color: Colors.pink[200],
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
        color: Colors.pink[200],
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
