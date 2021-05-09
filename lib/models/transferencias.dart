import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencia = [];

  List<Transferencia> get transferencias => this._transferencia;

  adicionar(Transferencia novaTransferencia) {
    transferencias.add(novaTransferencia);
    notifyListeners();
  }
}
