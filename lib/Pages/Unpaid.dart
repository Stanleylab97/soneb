import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
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
                "Liste des factures impayées: ",
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
                  return Card(
                    
                    elevation: 2,
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today),
                              Text(snapshot.data[index]['userId'].toString() +
                                  "\n" +
                                  snapshot.data[index]['id'].toString() +
                                  "\n" +
                                  snapshot.data[index]['title'] +
                                  "\n" +
                                  snapshot.data[index]['body'])
                            ],
                          )
                        ],
                      ),
                    ),
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
    Response response = await networkHandler.get("");
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
