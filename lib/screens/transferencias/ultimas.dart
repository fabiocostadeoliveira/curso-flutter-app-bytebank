import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = "Ultimas Transferencias";

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _ultimasTrasferencias =
              transferencias.transferencias.reversed.toList();

          final _tamanhoListaUltimasTransferencias =
              getTamanhoListaUltimasTransferencias(
                  _ultimasTrasferencias.length);

          if (_tamanhoListaUltimasTransferencias == 0) {
            return SemTransferenciasCadastrada();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _tamanhoListaUltimasTransferencias,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTrasferencias[indice]);
            },
          );
        }),
        RaisedButton(
          color: Colors.green,
          child: Text('Ver todas transferencias'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaTransferencias();
              }),
            );
          },
        )
      ],
    );
  }

  int getTamanhoListaUltimasTransferencias(tamanhoOriginal) {
    int tamanhoDefault = 2;
    if (tamanhoOriginal < 3) {
      tamanhoDefault = tamanhoOriginal;
    }
    return tamanhoDefault;
  }
}

class SemTransferenciasCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Não existe transferencias lançadas",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
