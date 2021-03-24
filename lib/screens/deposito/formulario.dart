import 'package:bytebank/components/genericTextField.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber Depósito';
const _labelTextValor = 'Valor';
const _hintTextValor = '0.00';
const _tituloBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
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
              controlador: _controladorCampoValor,
              labelText: _labelTextValor,
              hintText: _hintTextValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_tituloBotaoConfirmar),
              onPressed: () => _criarDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criarDeposito(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _depositoIsValid(valor);

    if (depositoValido) {
      _atualizarEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _depositoIsValid(valor) {
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizarEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adicionar(valor);
  }
}
