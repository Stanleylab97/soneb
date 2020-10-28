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

    return Column(
      children: [invoiceHeader(), InvoiceBody()],
    );
  }

  Widget invoiceHeader() {
    return Container(
      color: Colors.white,
      height: 200,
      width: double.infinity,
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
        ],)
    );
  }

  Column addressColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Zone",
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
    );
  }

  Text topHeaderText(String label) {
    return Text(label,
        style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: ScreenConfig.getProportionalHeight(31)));
  }
}
