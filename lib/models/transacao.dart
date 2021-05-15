import 'package:bytebank/enums/tipoTransacao.dart';

class Transacao {
  EnumTipoTransacao tipo;
  double valor;
  String detalhes;

  Transacao(this.tipo, this.valor, this.detalhes);

  @override
  String toString() {
    return '';
  }
}
