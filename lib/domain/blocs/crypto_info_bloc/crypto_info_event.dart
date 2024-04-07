part of 'crypto_info_bloc.dart';

class CryptoInfoEvent {}

class CryptoAInfoLoadCryptoChartEvent extends CryptoInfoEvent {
  final String cryptoSymbol;

  CryptoAInfoLoadCryptoChartEvent({required this.cryptoSymbol});
}
