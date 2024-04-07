part of 'crypto_info_bloc.dart';

class CryptoInfoState {}

final class CryptoInfoLoadingState extends CryptoInfoState {}

final class CryptoInfoLoadedState extends CryptoInfoState {
  final String cryptoSymbol;
  final List<CryptoModel> cryptoModels;

  CryptoInfoLoadedState({
    required this.cryptoSymbol,
    required this.cryptoModels,
  });
}

final class CryptoInfoFailureState extends CryptoInfoState {
  final ApiException failure;

  CryptoInfoFailureState({required this.failure});
}
