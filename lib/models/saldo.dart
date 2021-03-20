import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adicionar(double valor) {
    this.valor += valor;
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}
