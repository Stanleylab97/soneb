import 'package:flutter/material.dart';
import 'package:sbeepay/config/MoMoRequests.dart';
import 'package:sbeepay/config/constants.dart';

class PaymentsMethods extends StatefulWidget {
  @override
  _PaymentsMethodsState createState() => _PaymentsMethodsState();
}

class _PaymentsMethodsState extends State<PaymentsMethods> {
  TextEditingController _telephoneController = TextEditingController();
  MoMoRequests moMoRequests;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            right: true,
            left: true,
            child: Column(children: [
              Container(
                height: 50.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
                ]),
                child: Row(children: <Widget>[
                  Flexible(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                        Icon(Icons.arrow_back_ios,
                            size: 18, color: Colors.orange),
                        Text('Retour',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600))
                      ])),
                  Flexible(
                      child: Text(
                    'Paiement',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  )),
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(children: <Widget>[
                  Flexible(
                      flex: 2,
                      child: Row(

                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/images/mtn.jpeg",
                               fit: BoxFit.fill
                            ),
                          ),
                          Flexible(
                            child: Image.asset(
                              "assets/images/moov.jpg",
                              width: 120, height: 90, fit: BoxFit.fill
                            ),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 2,
                      child: Center(
                          child: Image.asset(
                        "assets/images/moov.jpg",
                        fit: BoxFit.fitWidth,
                      ))),
                  Flexible(
                      flex: 2,
                      child: Center(
                          child: Image.asset(
                        "assets/images/moov.jpg",
                        fit: BoxFit.fitWidth,
                      ))),
                ]),
              )
            ])));
    /* Scaffold(
        body: Container(
          height:ScreenConfig.getProportionalHeight(800) ,
      padding: EdgeInsets.all(20),
      child: Column(
        
        children: [
        SizedBox(
          height: ScreenConfig.getProportionalHeight(120),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choisissez un moyen de paiement",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(60),
            ),
            Text(
              "Réseaux GSM",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(60),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _displayDialog(context, 1);
                  },
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/images/mtn.jpeg",
                          width: 120, height: 90, fit: BoxFit.fill),
                    ),
                  ),
                ),
                InkWell(
              onTap: () {
                _displayDialog(context, 2);
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/moov.jpg",
                      width: 120, height: 90, fit: BoxFit.fill),
                ),
              ),
            ),
              ],
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(60),
            ),
            Text(
              "Banques affiliées",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenConfig.getProportionalHeight(60),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              InkWell(
              onTap: () {},
              child: Container(
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/boa.jpg",
                      width: 120, fit: BoxFit.fill),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/uba.png",
                      width: 120, fit: BoxFit.fill),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/ecobank.jpg",
                      width: 120, fit: BoxFit.fill),
                ),
              ),
            ),
            ],),
            
          ],
        ),
      ]),
    )); */
  }

  _displayDialog(BuildContext context, int i) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Veuillez entrer votre numéro de téléphone',
                textAlign: TextAlign.center),
            content: TextField(
              controller: _telephoneController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Ex: 97XXXXXX"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Payer'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
/*  showDialog(
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
                    });  */
