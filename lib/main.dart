import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transfèrencia'),
      ),
      body: Text('teste'),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferncia(200.00, 554545)),
          ItemTransferencia(Transferncia(300.00, 554545)),
          ItemTransferencia(Transferncia(600.00, 554545)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferncia _transferncia;

  const ItemTransferencia(this._transferncia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferncia.valor.toString()),
        subtitle: Text(_transferncia.numeroConta.toString()),
      ),
    );
  }
}

class Transferncia {
  final double valor;
  final int numeroConta;

  Transferncia(
    this.valor,
    this.numeroConta,
  );
}
