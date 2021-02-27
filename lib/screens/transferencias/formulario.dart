import 'package:bytebank/components/genericTextField.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transfèrencia';

const _labelTextNumeroDaConta = 'Numero da Conta';
const _hintTextNumeroDaConta = '0000';

const _labelTextValor = 'Valor';
const _hintTextValor = '0.00';

const _tituloBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditorTextField(
              controlador: _controladorCampoNumeroConta,
              labelText: _labelTextNumeroDaConta,
              hintText: _hintTextNumeroDaConta,
            ),
            EditorTextField(
              controlador: _controladorCampoValor,
              labelText: _labelTextValor,
              hintText: _hintTextValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_tituloBotaoConfirmar),
              onPressed: () => _criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (_isTranferenciaValida(numeroConta, valor)) {
      final transferenciaCriada = Transferencia(numeroConta, valor);
      Navigator.pop(context, transferenciaCriada);
    }
  }

  bool _isTranferenciaValida(numeroConta, valor) {
    return numeroConta != null && valor != null;
  }
}
