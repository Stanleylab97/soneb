import 'package:sonebpay/Models/period.dart';

import 'compteur.dart';

class Facture {
  String numFact;
  int lastIndex, newIndex, nbkwh;
  String montantFact;
  Periode periode;
  Compteur compteur;

  Facture(this.numFact, this.periode, this.lastIndex, this.newIndex, this.nbkwh,
      this.montantFact, this.compteur);
}
