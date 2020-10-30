import 'package:flutter/material.dart';
import 'package:sbeepay/config/constants.dart';
import 'package:sbeepay/widgets/invoice_body.dart';

class BillsScreen extends StatefulWidget {
  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig.init(context);

    return Scaffold(
      body: Column(
        children: [invoiceHeader(), InvoiceBody()],
      ),
    );
  }

  Widget invoiceHeader() {
    return Container(
        color: Colors.grey[300],
        height:
            ScreenConfig.deviceHeight - ScreenConfig.getProportionalHeight(930),
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            SizedBox(height: ScreenConfig.getProportionalHeight(60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.jpeg",
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  width: ScreenConfig.getProportionalWidth(20),
                ),
                Text("SOCIETE BENINOISE D'ENERGIE ELECTRIQUE",
                    style: TextStyle(color: Colors.pink[600], fontSize: 14))
              ],
            ),
            SizedBox(height: ScreenConfig.getProportionalHeight(35)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Facture n° FE 594211224256",style: TextStyle(fontSize: 16),),
            ],),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Abonné",
                      style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                      
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Numéro Abonné: 787788",
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("Catégorie: 01 Particulier")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    SizedBox(
                      height:42,
                    ),
                    
                   
                    Text("Client: DOSSOU Luc")
                  ],
                ),
              ],
            ),
            SizedBox(height: ScreenConfig.getProportionalHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            )
          ],
        ));
  }



  Text topHeaderText(String label) {
    return Text(label,
        style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: ScreenConfig.getProportionalHeight(31)));
  }
}
