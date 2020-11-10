import 'dart:async';
import 'dart:convert';

import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:sbeepay/Models/abonne.dart';
import 'package:sbeepay/Models/category.dart';
import 'package:sbeepay/Models/compteur.dart';
import 'package:sbeepay/Models/facture.dart';
import 'package:sbeepay/Models/period.dart';
import 'package:sbeepay/Pages/BillsScreen.dart';
import 'package:sbeepay/config/NetworkHandler.dart';

class UnpaidBills extends StatefulWidget {
  @override
  _UnpaidBillsState createState() => _UnpaidBillsState();
}

class _UnpaidBillsState extends State<UnpaidBills> {
  StreamController _streamController;
  Stream _stream;
  NetworkHandler networkHandler = NetworkHandler();

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
    _getUnpaids();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StateCompteur("GD22788", 14390),
        SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Liste des factures du compteur: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ]),
        SizedBox(height: 20),
        Expanded(
          child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Text("Vous n'avez pas de facture impayé"),
                );
              }

              if (snapshot.data == "waiting") {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  print(snapshot.data);
                  var facture = Facture(snapshot.data[index]['numFact'],Periode(snapshot.data[index]['periode']['periodFact'],snapshot.data[index]['periode']['dateEcheance']),snapshot.data[index]['lastIndex'],snapshot.data[index]['newIndex'],snapshot.data[index]['nbkwh'],snapshot.data[index]['montantFact'],Compteur(snapshot.data[index]['compteur']['numPolice'],snapshot.data[index]['compteur']['carre'] ,Abonne(snapshot.data[index]['compteur']['abonne']['numAbonne'],snapshot.data[index]['compteur']['abonne']['nom'],snapshot.data[index]['compteur']['abonne']['tel'],snapshot.data[index]['compteur']['abonne']['adresse'], Categorie(snapshot.data[index]['compteur']['abonne']['categorie']['libelle']))));
                  return ListTile(
                    leading: ClayContainer(
                      width: 40,
                      height: 40,
                      borderRadius: 8,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x00000000),
                                Color(0xFFB6BAA6),
                              ]).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Icon(
                          Icons.done,
                          color: Colors.green[400],
                          size: 30,
                        ),
                      ),
                    ),
                    title: Text(
                      facture.numFact,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    subtitle: Text(
                      "Consommation: "+ facture.nbkwh.toString() +" Kwh",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text(facture.montantFact+" XOF",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        )),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BillsScreen(facture:facture)),
                        );
                      });
                    },
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }

  _getUnpaids() async {
    _streamController.add("waiting");
    Response response = await networkHandler.get("/easier/factures");
    _streamController.add(json.decode(response.body));
  }
}

class StateCompteur extends StatelessWidget {
  String numCompteur;
  int totalUnpaid;
  StateCompteur(this.numCompteur, this.totalUnpaid);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .06),
        Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * .16,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(25)),
          ),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Numéro Compteur: ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(this.numCompteur,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total impayé: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(this.totalUnpaid.toString() + " XOF",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
