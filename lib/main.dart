import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //body: FormularioTransferencia(),
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transfèrencia'),
      ),
      body: Column(
        children: [
          EditorTextField(
            controlador: _controladorCampoNumeroConta,
            labelText: 'Numero da conta',
            hintText: '0000',
          ),
          EditorTextField(
            controlador: _controladorCampoValor,
            labelText: 'Valor',
            hintText: '0.00',
            icon: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _criarTransferencia(context),
          ),
        ],
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferncia(numeroConta, valor);

      debugPrint('Criando Transferencia');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class ListaTransferencias extends StatelessWidget {
  final List<Transferncia> _transferencias = List();
  @override
  Widget build(BuildContext context) {
    _transferencias.add(Transferncia(1001, 2.0));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferncia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('$transferenciaRecebida');
            _transferencias.add(transferenciaRecebida);
          });
        },
      ),
    );
  }
}

class EditorTextField extends StatelessWidget {
  final TextEditingController controlador;
  final String labelText;
  final String hintText;
  final IconData icon;

  const EditorTextField({
    this.controlador,
    this.labelText,
    this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: labelText,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
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
  final int numeroConta;
  final double valor;

  Transferncia(
    this.numeroConta,
    this.valor,
  );

  @override
  String toString() => 'Transferncia(valor: $valor, numeroConta: $numeroConta)';
}
