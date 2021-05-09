class Transferencia {
  final int numeroConta;
  final double valor;

  Transferencia(
    this.numeroConta,
    this.valor,
  );

  String toStringValor() {
    return 'R\$ $valor';
  }

  String toStringConta() {
    return 'Conta: $numeroConta';
  }

  @override
  String toString() =>
      'Transferencia(valor: $valor, numeroConta: $numeroConta)';
}
