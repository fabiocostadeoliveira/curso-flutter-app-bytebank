import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/dashboards/dashboard.dart';
//import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Saldo(0),
        ),
        ChangeNotifierProvider(
          create: (context) => Transferencias(),
        ),
      ],
      child: ByteBankApp(),
    ));

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[800],
        accentColor: Colors.green[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      //home: ListaTransferencias(),
      home: Dashboard(),
    );
  }
}
