enum EnumTipoTransacao {
  TRANSFERENCIA,
  DEPOSITO,
}

extension EnumTipoTransacaoExtension on EnumTipoTransacao {
  String get name {
    switch (this) {
      case EnumTipoTransacao.DEPOSITO:
        return 'Depósito';
      case EnumTipoTransacao.TRANSFERENCIA:
        return 'Transferencia';
      default:
        return null;
    }
  }
}
