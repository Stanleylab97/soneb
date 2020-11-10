import 'package:flutter/foundation.dart';

import 'category.dart';

class Abonne {
  final String numAbonne, nom, adresse, tel;
  final Categorie category;

  Abonne(this.numAbonne, this.nom, this.tel, this.adresse, this.category);
}
